extends Control

@onready var button_back_to_menu: Button = %"Button Back To Menu"
@onready var button_next_level: Button = %"Button Next Level"

signal next_level_requested

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	button_next_level.pressed.connect( func () -> void:
		emit_signal('next_level_requested')
		)


func stop_game() -> void:
	show()
	get_tree().paused = true
