class_name Platform extends StaticBody2D


var current_mouse_position : int = 0
var next_mouse_position : int = 0
var mouse_velocity : float = 0.0
var active_powerup : String = ""

@export_range(1.0, 2.0) var length_multiplier : float = 2.0

@onready var platform_sprite: Sprite2D = %PlatformSprite
@onready var platform_shape: CollisionShape2D = %PlatformShape
@onready var catcher_shape: CollisionShape2D = %CatcherShape

@onready var default_geometry : Dictionary[String,float] = {
	"platform_sprite" : platform_sprite.scale.x,
	"platform_shape" : platform_shape.shape.height,
	"catcher_shape" : catcher_shape.shape.size.x,
}

@onready var timer_length: Timer = %TimerLength
@onready var timer_sticky: Timer = %TimerSticky
@onready var timer_laser: Timer = %TimerLaser


func _ready() -> void:
	_connect_timers()
	
	Input.warp_mouse(
		Vector2(
			get_viewport_rect().size.x / 2, position.y
			)
		)


func _physics_process(_delta: float) -> void:
	position.x = get_global_mouse_position().x
	position.x = max(64, position.x)
	position.x = min(position.x, get_viewport_rect().size.x - 64)


func get_collision_shape() -> CollisionShape2D:
	return platform_shape


func activate_powerup(powerup_info : PowerupInfoPlatform) -> void:
	var description : String = powerup_info.description

	if description == "length":
		activate_length_powerup(powerup_info.duration_seconds)

	elif description == "sticky":
		print("Sticky powerup active")
		
	elif description == "laser":
		pass


func activate_length_powerup(duration_seconds :float) -> void:
	#print("powerup length acquired")
	timer_length.one_shot = true
	timer_length.wait_time = duration_seconds
	timer_length.start()
	
	if active_powerup == "length":
		#print("powerup is active already, time increased")
		return

	_set_active_powerup("length")
	_scale_length_by(length_multiplier)
	#print("length increased")


func _scale_length_by(factor : float) -> void:
	platform_sprite.scale.x = factor * default_geometry["platform_sprite"]
	platform_shape.shape.height = factor * default_geometry["platform_shape"]
	catcher_shape.shape.size.x = factor * default_geometry["catcher_shape"]


func _set_active_powerup(powerup_description : String) -> void:
	## Set active powerup and override the current powerup
	if powerup_description == "length":
		timer_laser.timeout.emit()
		timer_sticky.timeout.emit()
	elif powerup_description == "laser":
		timer_length.timeout.emit()
		timer_sticky.timeout.emit()
	elif powerup_description == "sticky":
		timer_length.timeout.emit()
		timer_sticky.timeout.emit()
	else:
		return
	active_powerup = powerup_description


func _connect_timers() -> void:
	timer_length.timeout.connect(
	func () -> void:
		_reset_length()
		active_powerup = ""
)


func _reset_length() -> void:
	_scale_length_by(1.0)
