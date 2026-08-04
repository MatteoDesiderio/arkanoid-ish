class_name Platform extends StaticBody2D

# @export var speed : float = 700.0

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
