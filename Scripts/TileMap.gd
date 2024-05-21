extends TileMap

enum layers{
	level0 = 0,
	level1 = 1,
	level2 = 2,
}

const modra_kytka = { 'energy': 20 }

@onready var player = $"../Player"

const green_block_atlas_pos = Vector2i(2, 0)
const blue_block_atlas_pos = Vector2i(0, 0)
const boundary_atlas_pos = Vector2i(0, 1)
const main_source = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	place_boundaries()
			
						# Here is where I should be doing some kind of translation
						# from cartesian coords to isometric coords
			#var cell_position = Vector2(height, width)
			#
			#set_cell(layers.level0,cell_position,0,Vector2(value_x,value_y),0)
	
func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			
			var clicked_cell = local_to_map(get_local_mouse_position())
			var data = get_cell_source_id(layers.level1, clicked_cell)
		
			if data == 2:
				if player.actual_player_health < player.player_health_limit:
					if player.player_health_limit - player.actual_player_health < 20:
						player.actual_player_health += player.player_health_limit - player.actual_player_health
				
					elif player.player_health_limit - player.actual_player_health >= modra_kytka.energy:
						player.actual_player_health += 20
				
	
func place_boundaries():
	var offsets = [
		Vector2i(0, -1),
		Vector2i(0, 1),
		Vector2i(1, 0),
		Vector2i(-1, 0),
	]
	var used = get_used_cells(layers.level0)
	for spot in used:
		for offset in offsets:
			var current_spot = spot + offset
			#this spot is empty
			if get_cell_source_id(layers.level0, current_spot) == -1:
				set_cell(layers.level0, current_spot, main_source, boundary_atlas_pos)
	
func place_platform():
	for y in range(3):
		for x in range(3):
			set_cell(layers.level0, Vector2i(2 + x, 2 + y), main_source, green_block_atlas_pos)
	
	set_cell(layers.level1, Vector2i(2, 2), main_source, blue_block_atlas_pos)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
