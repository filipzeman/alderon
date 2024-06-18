extends Node2D

@onready var FarmTilemap = get_parent()

var flower_atlas = Vector2i(0, 0)
var flower_id = 2

func _ready() -> void:
	pass
	

func handle_interaction():
	var clicked_cell = FarmTilemap.local_to_map(get_local_mouse_position())
	var clicked_terrain_tile_id = FarmTilemap.get_cell_source_id(Globals.layers.terrain, clicked_cell)
	var clicked_foliage_tile_id = FarmTilemap.get_cell_source_id(Globals.layers.foliage, clicked_cell)
	
	if clicked_terrain_tile_id == -1:
		return null

	# when there is no foliage
	if clicked_foliage_tile_id == -1:
		# if it is dirt tile which can be used for farming
		if clicked_terrain_tile_id == 1:
			plant_seed(clicked_cell, flower_id, flower_atlas)
	
	# when tile contains foliage (tree, seed, ,...)
	if clicked_foliage_tile_id != -1:
		
		#check if dirt tile and check if harvestable
		if clicked_terrain_tile_id == 1:
			remove_tile(clicked_cell)


func plant_seed(tile_coord: Vector2, block_id: int, atlas_coord: Vector2i ):
	FarmTilemap.set_cell(Globals.layers.foliage, tile_coord, block_id, atlas_coord)
	FarmState.add_item(tile_coord, 1, GlobalTimer.days, 3, 2, false, FarmState.SeedType.hornbeam)

#func harvest_crop(tile_coord: Vector2, block_id: int, atlas_coord: Vector2i ):
	#FarmTilemap.set_cell(Globals.layers.foliage, tile_coord, block_id, atlas_coord)
	#FarmState.add_item(tile_coord, 1, 3, false, FarmState.SeedType.hornbeam)

func remove_tile(tile_coord: Vector2i) -> void:
	print(tile_coord)
	FarmTilemap.set_cell(Vector2i(tile_coord), -1)
	#FarmState.remove_item(tile_coord, 1, GlobalTimer.days, 3, 2, false, FarmState.SeedType.hornbeam)
