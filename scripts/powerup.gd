class_name Powerup extends Area2D


@export var fall_speed : float = 400.0

var powerup_info : PowerupInfo

signal powerup_obtained


func _ready() -> void:
	body_entered.connect(_on_body_entered)
	#decorate_powerup()

func _process(delta: float) -> void:
	position.y += delta * fall_speed


func _on_body_entered(body : Node2D) -> void:
	if body is PowerupCatcher:
		emit_signal("powerup_obtained", powerup_info)
	queue_free()
