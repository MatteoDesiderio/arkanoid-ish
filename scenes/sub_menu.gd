extends TextureRect

@export var back_button: Button

func _ready() -> void:
	back_button.pressed.connect(hide)
