extends Control

@onready var button_back_to_menu: Button = %"Button Back To Menu"
@onready var button_try_again: Button = %"Button Try Again"

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	
	button_try_again.pressed.connect( func() -> void:
		get_tree().paused = false
		get_tree().reload_current_scene()
		print('Signal up to level_content.tscn, for resetting score')
	)


func stop_game() -> void:
	show()
	get_tree().paused = true
	
