class_name GameData extends Resource

#@export var is_first_playthrough : = true
@export var level_data_list : Array[LevelData]

func _init(
	#p_is_first_playthrough : bool = true,
	p_level_data_list : Array[LevelData] = []
	) -> void:
	print('initializing game data')
	#is_first_playthrough = p_is_first_playthrough
	level_data_list = p_level_data_list
