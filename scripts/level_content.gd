extends Node2D

## Health


## Bouncy ball
@onready var ball: CharacterBody2D = %Ball
## Player controlled, moving platform
@onready var platform: Platform = %Platform
## Bricks of the level
@onready var bricks: TileMapLayer = %Bricks



## Tracks the damage of each brick
var damage_tracker : Dictionary[Vector2i, int] = {}

func _ready() -> void:
	ball.brick_hit.connect(_on_brick_hit)
	ball.platform_hit.connect(_on_platform_hit)
	ball.walls_hit.connect(_on_walls_hit)
	_fill_damage_tracker()

func _on_brick_hit(hit_point : Vector2):
	platform.get_collision_shape().disabled = false

	var hit_cell_position : = get_closest_cell_to_point(hit_point)
	damage_and_break_brick(hit_cell_position)


func _on_platform_hit() -> void:
	platform.get_collision_shape().disabled = true


func _on_walls_hit() -> void:
	platform.get_collision_shape().disabled = false


func _on_ground_hit() -> void:
	# take_health_damage(1)
	platform.get_collision_shape().disabled = true

func _fill_damage_tracker():
	for brick : Vector2i in bricks.get_used_cells():
		# TODO check whether alt tile ID corresponds to an already damaged brick
		damage_tracker[brick] = 0

func get_closest_cell_to_point(point : Vector2) -> Vector2i:
	var cells : = bricks.get_used_cells()
	var hit_point_local : Vector2i = to_local(point)
	var cells_positions : = cells.map(bricks.map_to_local)
	var distances_from_hit : = cells_positions.map(hit_point_local.distance_to)
	var idx_closest : int = distances_from_hit.find(distances_from_hit.min())
	return cells[idx_closest] 


func damage_and_break_brick(cell_position : Vector2i) -> void:
	var inflicted_damage : int = 1 # TODO will become an input variable

	if not _is_breakable(cell_position):
		return
	
	var previous_damage : int =  _get_current_damage(cell_position)
	_set_current_damage(cell_position, inflicted_damage)
	
	var current_damage : int = _get_current_damage(cell_position)
	var max_damage : int = _get_max_damage(cell_position)
	print(current_damage, ' - ', max_damage)
	if current_damage >= max_damage:
		bricks.erase_cell(cell_position)
		# early return to avoid alt_tile ID increase beyond max in _show_damage 
		return 
	
	_show_damage(cell_position, previous_damage)


func _is_breakable(cell_position : Vector2i) -> bool:
	var data : = bricks.get_cell_tile_data(cell_position)
	return data.get_custom_data('is_breakable')


func _get_current_damage(cell_position : Vector2i) -> int:
	return damage_tracker[cell_position]


func _set_current_damage(cell_position : Vector2i, inflicted_damage : int) -> void:
	damage_tracker[cell_position] += inflicted_damage


func _get_max_damage(cell_position : Vector2i) -> int:
	var data : = bricks.get_cell_tile_data(cell_position)
	return data.get_custom_data('max_damage')


func _show_damage(cell_position : Vector2i, previous_damage : int) -> void:
	# SOURCE ID (II argument) IS 2 FOR THE BREAKABLE BRICK !!!!
	# SUBJECT TO CHANGE IF THE TILES CHANGE!
	bricks.set_cell(cell_position, 2, Vector2i.ZERO, previous_damage + 1)
