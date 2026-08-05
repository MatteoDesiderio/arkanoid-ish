@tool
extends Control

func _ready() -> void:
	if Engine.is_editor_hint():
		
		return
		
	if not Engine.is_editor_hint():
		return
