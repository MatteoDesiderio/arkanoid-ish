class_name LevelDataList extends Resource

@export var list : Array[LevelData] = []
@export var number_of_levels : int


func _init(p_list = [], p_number_of_levels = 1) -> void:
	number_of_levels = p_number_of_levels

	for idx : int in number_of_levels:
		list[idx] = LevelData.new(idx, number_of_levels)
