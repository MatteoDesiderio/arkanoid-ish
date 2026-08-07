@tool
extends Control

@export var game_data : GameData

func _ready() -> void:
	if Engine.is_editor_hint():
		push_warning("Resetting the game data. Levels > 0 are now locked again.")
		_setup_utility()
		return

	if not Engine.is_editor_hint():
		game_data = ResourceLoader.load(
			"res://others/my_game_data.tres", 
			"GameData"
			)

func _setup_utility():
	## Create Game Data Resource in editor for the first time
	var search_path : = "res://scenes/levels/"
	var level_paths : = DirAccess.get_files_at(search_path)
	var next_level_paths : = level_paths.duplicate()
	var num_lvls : int = level_paths.size()
	# TODO: instead of looping back to 1st level, send it to main menu or cutscene
	next_level_paths.append(level_paths[0])
	next_level_paths.remove_at(0)
	
	var level_data_list : Array[LevelData] = []
	for idx in num_lvls:
		var is_unlocked = (idx == 0)
		var level_data : LevelData = LevelData.new(
			idx,
			num_lvls,
			search_path + level_paths[idx],
			search_path + next_level_paths[idx],
			is_unlocked
			)
		level_data_list.append(level_data)

	var new_game_data : = GameData.new(level_data_list)
	new_game_data.take_over_path("res://others/my_game_data.tres")
	ResourceSaver.save(new_game_data, "res://others/my_game_data.tres")
	game_data = load("res://others/my_game_data.tres")
