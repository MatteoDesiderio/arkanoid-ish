extends CharacterBody2D

@export var speed : float = 300.0

var is_active : bool = true

var initial_angle_range : float = PI / 4
var direction : Vector2
var active_powerup : String = ""
var is_not_main_ball = false

signal brick_hit(collision_point : Vector2)
signal platform_hit
signal walls_hit
signal ground_hit(ball_name:String)

@onready var timer_sticky: Timer = %TimerSticky


func _ready() -> void:
	direction = Vector2.UP.rotated(randf_range(-1, +1) * initial_angle_range)
	_connect_timers()
	stop()


func stop() -> void:
	is_active = false


func start() -> void:
	is_active = true
	#direction = Vector2(randf_range(-1, +1) * initial_direction_range, -1).normalized()


func _physics_process(delta: float) -> void:
	if is_active == false:
		return
	
	var collision := move_and_collide(direction * delta * speed)
	if collision == null:
		return

	var collider_from_collision = collision.get_collider()
	direction = direction.bounce(collision.get_normal())

	if collider_from_collision is Bricks:
		emit_signal(
			'brick_hit', 
			collision.get_position()
			)
		set_collision_mask_value(3, true)
		
	if collider_from_collision is Wall:
		emit_signal(
			'walls_hit'
			)
		set_collision_mask_value(3, true)
		
		if collider_from_collision is Ground:
			emit_signal(
				'ground_hit',
				name
				)
			set_collision_mask_value(3, false)
			
			queue_free()


	if collider_from_collision is Platform:
		#if direction.y > 0:
		#	direction.y *= -1.0
		direction = _get_bounce_direction_platform(
			collider_from_collision, 
			collision.get_position()
			)
		emit_signal(
			'platform_hit'
			)
		set_collision_mask_value(3, false)

	_prevent_horizontal_bounce()


func _get_bounce_direction_platform(platform : Platform, collision_position : Vector2):
	## Return a vector direction with angle 0 to +/- 45 degrees (with respect to
	## the vertical on the bounce point) based on the horizontal distance 
	## between said bounce point and the center of the platform   
	var sprite : Sprite2D = platform.get_node('PlatformSprite')
	var half_width : float = sprite.get_rect().size.x / 2.0
	
	var distance : Vector2 = collision_position - platform.position 
	
	return Vector2(distance.x / half_width, -1).normalized()


func _prevent_horizontal_bounce() -> void:
	## Prevent bounce that has very small y component, such that 
	## the ball does not get stuck bouncing horizontally between 
	## surfaces for a very long time. 
	
	if abs(direction.y) < 0.05:
		direction.y = 0.1 * ([-1, 1].pick_random())


func activate_powerup(powerup_info : PowerupInfoBall) -> void:
	var description : String = powerup_info.description
	
	if description == "sticky":
		timer_sticky.wait_time = powerup_info.duration_seconds
		timer_sticky.start()
		
		if active_powerup == "sticky":
			return
		
		active_powerup = "sticky"
		platform_hit.connect(stop)

	elif description == "bomb":
		pass


func _connect_timers() -> void:
	timer_sticky.timeout.connect(
	func () -> void:
		platform_hit.disconnect(stop)
		active_powerup = ""
)
