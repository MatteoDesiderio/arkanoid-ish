extends Button


@onready var label_count: Label = %"Label Count"
@onready var counter: Label = %Counter

var level_data : LevelData


func _ready() -> void:
	pressed.connect(_on_pressed)


func setup() -> void:
	label_count.text = "%s/%s" % [level_data.level_index, level_data.number_of_levels]
	counter.text = str(level_data.high_score)
	disabled = not(level_data.is_unlocked)


func resize(width : float) -> void:
	custom_minimum_size = Vector2(width, width)


func _on_pressed() -> void:
	get_tree().change_scene_to_file(level_data.current_level_path)
	
	
	
	
