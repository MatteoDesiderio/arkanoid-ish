#@tool
extends Control

@export var game_data : GameData

@onready var select_level_button: Button = %"Select Level Button"
@onready var level_selection_sub_menu: TextureRect = %"Level Selection Sub Menu"

@onready var options_button: Button = %"Options Button"
@onready var options_sub_menu: TextureRect = %"Options Sub Menu"


func _ready() -> void:
	if Engine.is_editor_hint():
		print("Resetting the game data. Levels > 0 are now locked again.")
		reset_game_data()
		return

	if not Engine.is_editor_hint():
		game_data = ResourceLoader.load(
			"res://others/my_game_data.tres", 
			"GameData"
			)

		select_level_button.pressed.connect(_on_select_level_button_pressed)
		options_button.pressed.connect(_on_options_button_pressed)
		
		level_selection_sub_menu.fill_grid(game_data.level_data_list)


func _on_select_level_button_pressed() -> void:
	level_selection_sub_menu.show()


func _on_options_button_pressed() -> void:
	options_sub_menu.show()


func reset_game_data():
	## Create Game Data Resource in editor for the first time
	var search_path : = "res://scenes/levels/"
	var level_paths : = DirAccess.get_files_at(search_path)
	var next_level_paths : = level_paths.duplicate()
	var num_lvls : int = level_paths.size()

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
	
	# send back to main menu
	level_data_list[-1].next_level_path = scene_file_path
	
	var new_game_data : = GameData.new(level_data_list)
	new_game_data.take_over_path("res://others/my_game_data.tres")
	ResourceSaver.save(new_game_data, "res://others/my_game_data.tres")
	game_data = load("res://others/my_game_data.tres")
