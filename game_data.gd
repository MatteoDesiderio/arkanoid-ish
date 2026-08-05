class_name GameData extends Resource

@export var number_of_levels : int
@export var level_list : LevelDataList


func _init(p_number_of_levels = 1, p_level_list = []) -> void:
	number_of_levels = p_number_of_levels
	level_list = LevelDataList.new(p_number_of_levels)
