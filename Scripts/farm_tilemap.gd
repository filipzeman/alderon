extends TileMap

@onready var player = $"../Player"
@onready var interaction_handler = $InteractionHandler
# in future there will be config / dictionary from where 
# we take these information dynamically
var flower_atlas = Vector2i(0, 0)
var flower_id = 2

# original atlas configuration (collisions)
const green_block_atlas_pos = Vector2i(2, 0)
const blue_block_atlas_pos = Vector2i(0, 0)
const boundary_atlas_pos = Vector2i(0, 1)
const main_source = 0

func _ready() -> void:
	place_boundaries()

#player interaction with tilemap
func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var clicked_cell = local_to_map(get_local_mouse_position())
			interaction_handler.handle_interaction(clicked_cell)

func place_boundaries():
	var offsets = [
		Vector2i(0, -1),
		Vector2i(0, 1),
		Vector2i(1, 0),
		Vector2i(-1, 0),
	]
	var used = get_used_cells(Globals.layers.terrain)
	for spot in used:
		for offset in offsets:
			var current_spot = spot + offset
			#this spot is empty
			if get_cell_source_id(Globals.layers.terrain, current_spot) == -1:
				set_cell(Globals.layers.terrain, current_spot, main_source, boundary_atlas_pos)
	
func place_platform():
	for y in range(3):
		for x in range(3):
			set_cell(Globals.layers.terrain, Vector2i(2 + x, 2 + y), main_source, green_block_atlas_pos)
	
	set_cell(Globals.layers.foliage, Vector2i(2, 2), main_source, blue_block_atlas_pos)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
