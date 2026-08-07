class_name LevelData extends Resource


@export_file_path("res://scenes/levels/level*tscn") var current_level_path : String
@export_file_path("res://scenes/levels/level*tscn") var next_level_path : String
@export var is_unlocked : bool

var number_of_levels : int
var high_score : int
var level_index : int

func _init(
	p_level_index = 0,
	p_number_of_levels = 1,
	p_current_level_path = "",
	p_next_level_path = "",
	p_is_unlocked = false,
	p_high_score = 0,
	) -> void:
		print('initializing level data')

		level_index = p_level_index
		number_of_levels = p_number_of_levels

		current_level_path = p_current_level_path
		next_level_path =  p_next_level_path
		
		is_unlocked = p_is_unlocked
		
		if level_index == 0:
			is_unlocked = true
		
		high_score = p_high_score
		
			
	
