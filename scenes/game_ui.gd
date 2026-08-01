extends Control

@onready var life_point_container: HBoxContainer = %"Life Point Container"

func decrease_life_points() -> void:
	for point : TextureRect in life_point_container.get_children():
		point.hide()

func increase_life_points() -> void:
	for point : TextureRect in life_point_container.get_children():
		point.show()
