class_name Platform extends StaticBody2D


var current_mouse_position : int = 0
var next_mouse_position : int = 0
var mouse_velocity : float = 0.0


func _ready() -> void:
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
	return $CollisionShape2D


func administer_powerup(powerup_info : PowerupInfo) -> void:
	var description : String = powerup_info.description
	var duration_seconds : int = powerup_info.duration_seconds
	
	if description = 
