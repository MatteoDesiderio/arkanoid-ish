class_name Powerup extends Area2D


@export var fall_speed : float = 400.0

var powerup_info = null


func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _process(delta: float) -> void:
	position.y += delta * fall_speed


func _on_body_entered(_body : Node2D) -> void:
	queue_free()
