extends SubMenu

@onready var levels_grid: HFlowContainer = %"Levels Grid"

func _ready() -> void:
	super()


func fill_grid(level_data_list : Array[LevelData]) -> void:
	var n_columns : = 4
	var width = _get_button_width(n_columns)
	
	for level_data : LevelData in level_data_list:
		var panel : = Panel.new()
		
		panel.custom_minimum_size.x = width
		panel.custom_minimum_size.y = width
		levels_grid.add_child(panel)
		

func _get_button_width(n_buttons_in_row : int) -> float:
	var width : float = levels_grid.get_parent_area_size().x
	var h_space : float = levels_grid.get_theme_constant("h_separation")
	var button_width : float = (
		(width - (n_buttons_in_row - 1) * h_space) / n_buttons_in_row
		)
	return button_width
