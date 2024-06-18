extends TileMap

enum layers {
	terrain = 0,
	foliage = 1,
}

@onready var player = $"./Player"

# world generation variables
@export var noise_height_text: NoiseTexture2D
var noise : Noise

# size of generated world
var width: float = 50
var height: float = 50

# atlas configuration (temporary when have only 1 foliage asset)
var source_id = 2
var flower_atlas = Vector2i(0, 0)
var green_block = Vector2i(0, 0)

# original atlas configuration (collisions)
const green_block_atlas_pos = Vector2i(2, 0)
const blue_block_atlas_pos = Vector2i(0, 0)
const boundary_atlas_pos = Vector2i(0, 1)
const main_source = 0

func _ready() -> void:
	noise = noise_height_text.noise
	#generate_world()
	#place_boundaries()
	
# world generation using noise
func generate_world():
	for x in range(-width/2, width/2):
		for y in range(-height/2, height/2):
			set_cell(0, Vector2(x,y), 1, green_block)
			var noise_value :float = noise.get_noise_2d(x,y)
			if noise_value >= 0.111:
				set_cell(1, Vector2(x,y), source_id, flower_atlas)
	
func place_boundaries():
	var offsets = [
		Vector2i(0, -1),
		Vector2i(0, 1),
		Vector2i(1, 0),
		Vector2i(-1, 0),
	]
	var used = get_used_cells(layers.terrain)
	for spot in used:
		for offset in offsets:
			var current_spot = spot + offset
			#this spot is empty
			if get_cell_source_id(layers.terrain, current_spot) == -1:
				pass
				#set_cell(layers.terrain, current_spot, main_source, boundary_atlas_pos)
	
func place_platform():
	for y in range(3):
		for x in range(3):
			set_cell(layers.terrain, Vector2i(2 + x, 2 + y), main_source, green_block_atlas_pos)
	
	set_cell(layers.foliage, Vector2i(2, 2), main_source, blue_block_atlas_pos)
