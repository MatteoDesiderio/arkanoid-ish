class_name GameData extends Resource

@export var level_data_list : Array[LevelData]

func _init(p_level_data_list : Array[LevelData] = []) -> void:
	print('initializing game data')
	level_data_list = p_level_data_list
