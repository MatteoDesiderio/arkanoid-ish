extends Control

@onready var life_point_container: HBoxContainer = %"Life Point Container"
@onready var score_label: RichTextLabel = %ScoreLabel

func decrease_life_points_by_one() -> void:
	for point : TextureRect in life_point_container.get_children():
		if point.visible == true:
			point.hide()
			break
		else:
			pass

func increase_life_points() -> void:
	for point : TextureRect in life_point_container.get_children():
		point.show()
