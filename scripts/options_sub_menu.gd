extends SubMenu

var delete_data_button : Button


func _ready() -> void:
	super()
	delete_data_button = get_node(
		"Panel/MarginContainer/VBoxContainer/Delete Data Button"
		)
	delete_data_button.pressed.connect(_on_delete_data_button_pressed)


func _on_delete_data_button_pressed() -> void:
	var main_menu : Control = get_parent()
	main_menu.reset_game_data()
