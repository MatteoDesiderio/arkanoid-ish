extends SubMenu

@onready var levels_grid: GridContainer = %"Levels Grid"

func _ready() -> void:
	super()


func fill_grid(level_data_list : Array[LevelData]) -> void:
	for level_data : LevelData in level_data_list:
		var button : = Button.new()
		button.size_flags_vertical = Control.SIZE_EXPAND_FILL
		button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		
		button.text = "%s/%s\n" % [
			level_data.level_index, 
			level_data.number_of_levels
			]

		levels_grid.add_child(button)
		
