extends Button


@onready var label_count: Label = %"Label Count"
@onready var counter: Label = %Counter


func setup(data : LevelData) -> void:
	label_count.text = "%s/%s" % [data.level_index, data.number_of_levels]
	counter.text = str(data.high_score)
	disabled = not(data.is_unlocked)


func resize(width : float) -> void:
	custom_minimum_size = Vector2(width, width)

	
