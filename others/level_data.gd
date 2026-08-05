class_name LevelData extends Resource

@export var index : int 
@export var number_of_levels : int
@export_file_path("res://scenes/levels/level*tscn") var current_level_path : String
@export_file_path("res://scenes/levels/level*tscn") var next_level_path : String
@export var is_unlocked : bool
@export var high_score : int


func _init(
	p_index = 1, 
	p_number_of_levels = 1,
	p_current_level_path = "",
	p_next_level_path = "",
	p_is_unlocked = false,
	p_high_score = 0,
	) -> void:
		index = p_index
		number_of_levels = p_number_of_levels
		
		var levels_path = "res://scenes/levels/"
		var index_next = index + 1
		
		# TODO: when true, change next_level_path to main menu scene, as soon as main menu exists
		if index_next > p_number_of_levels:
			index_next = 1

		current_level_path = levels_path + "level_" + str(index) + ".tscn"
		next_level_path =  levels_path + "level_" + str(index+1) + ".tscn"
		
		if index == 1:
			is_unlocked = true
		else:
			is_unlocked = false
		
		high_score = 0
		
			
	
