extends CharacterBody2D

@export var speed : float = 300.0

var initial_direction_range : float = 0 

var direction : Vector2 = Vector2(randf_range(-1, 1) * initial_direction_range, -1).normalized()

signal brick_hit(collision_point : Vector2)
signal platform_hit
signal walls_hit


func _physics_process(delta: float) -> void:
	var collision := move_and_collide(direction * delta * speed)
		
	if collision == null:
		return
	
	direction = direction.bounce(collision.get_normal())
	
	var collider_from_collision = collision.get_collider()
	
	if collider_from_collision is Bricks:
		emit_signal(
			'brick_hit', 
			collision.get_position()
			)
		return
		
	if collider_from_collision is Wall:
		print('hit walls')
		emit_signal(
			'walls_hit'
			)
		return
	
	if collider_from_collision is Platform:
		if direction.y > 0:
			direction.y *= -1.0
		emit_signal(
			'platform_hit'
			)
		return
		
	
