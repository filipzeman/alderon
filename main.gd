extends Node2D

@export var noise_height_text: NoiseTexture2D
var noise : Noise

var width: int = 50
var height: int = 50

@onready var tile_map = $TileMap
var source_id = 2
var kytka_atlas = Vector2i(0, 0)
var sedy_blok = Vector2i(0, 0)


@onready var pause_menu = $PauseMenu

var paused = false

func _ready() -> void:
	pause_menu.hide()
	
	noise = noise_height_text.noise
	#generate_world()

func _process(_delta):
	if Input.is_action_just_pressed("ui_pause"):
		pauseMenu()
		
		
func generate_world():
	for x in range(-width/2, width/2):
		for y in range(-height/2, height/2):
			tile_map.set_cell(0, Vector2(x,y), 1, sedy_blok)
			var noise_value :float = noise.get_noise_2d(x,y)
			if noise_value >= 0.111:
				tile_map.set_cell(1, Vector2(x,y), source_id, kytka_atlas)
				
			#elif noise_value < 0.0:
				#tile_map.set_cell(0, Vector2(x,y), source_id, grey_atlas)
	
	
			
		
func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else: 
		pause_menu.show()
		Engine.time_scale = 0
		
	paused = !paused
