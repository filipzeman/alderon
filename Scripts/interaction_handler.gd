extends Node2D

@onready var FarmTilemap = get_parent()

class SeedConfiguration:
	var tileset_id: int
	var atlas_position: Vector2i
	var growth_phase_length: int
	var growth_steps: int
	var seed_type: PlantClass.SeedType

	func _init(tileset_id, atlas_position, growth_phase_length, growth_steps, seed_type) -> void :
		self.tileset_id = tileset_id
		self.atlas_position = atlas_position
		self.growth_phase_length = growth_phase_length
		self.growth_steps = growth_steps
		self.seed_type = seed_type


func _ready() -> void:
	pass
	

func handle_interaction(clicked_cell, player_position):
	var clicked_terrain_tile_id = FarmTilemap.get_cell_source_id(Globals.layers.terrain, clicked_cell)
	var clicked_foliage_tile_id = FarmTilemap.get_cell_source_id(Globals.layers.foliage, clicked_cell)
	var currentSeedConfig = SeedConfiguration.new(5,Vector2i(0,1),2,3,PlantClass.SeedType.oak)
	var isOccupied = FarmTilemap.local_to_map(player_position) == clicked_cell
	# print(FarmTilemap.local_to_map(player_position))
	# print(clicked_cell)
	# print('isOccupied', isOccupied)
	#ToDo - solve how to match player position to tile position

	
	# when there is no terrain don't do nothing
	if clicked_terrain_tile_id == -1:
		print('no terrain')
		return null


	# if player is located on the tile where user click, nothing happen
	#if clicked_foliage_tile_id && isOccupied:
		#return null

	# no foliage & terrain is dirt - suitable for farming
	if clicked_foliage_tile_id == -1 && clicked_terrain_tile_id == 5:
		print(str(currentSeedConfig))
		plant_seed(clicked_cell, currentSeedConfig.tileset_id, currentSeedConfig.atlas_position)
	
	# when tile contains foliage (tree, seed, ,...)
	if clicked_foliage_tile_id != -1:
		
		#check if dirt tile and check if harvestable
		if clicked_terrain_tile_id == 5:
			remove_tile(clicked_cell)


func plant_seed(tile_coord: Vector2, block_id: int, atlas_coord: Vector2i ):
	FarmTilemap.set_cell(Globals.layers.foliage, tile_coord, block_id, atlas_coord)
	FarmState.add_item(tile_coord, 0, GlobalTimer.days, 2, 3, false, PlantClass.SeedType.hornbeam)
	
#func harvest_crop(tile_coord: Vector2, block_id: int, atlas_coord: Vector2i ):
	#FarmTilemap.set_cell(Globals.layers.foliage, tile_coord, block_id, atlas_coord)
	#FarmState.add_item(tile_coord, 1, 3, false, FarmState.SeedType.hornbeam)

func remove_tile(tile_coord: Vector2i) -> void:
	FarmTilemap.set_cell(Globals.layers.foliage, tile_coord, -1)
	#FarmState.remove_item(tile_coord, 1, GlobalTimer.days, 3, 2, false, FarmState.SeedType.hornbeam)
