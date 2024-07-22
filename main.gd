extends Node2D

@onready var farm_scene = preload("res://Scenes/farm.tscn")
@onready var wilderness_scene = preload("res://Scenes/wilderness.tscn")
@onready var pause_menu = $PauseMenu

var paused = false

func _ready() -> void:
	sceneSelector()
	pause_menu.hide()
	
	
func _process(_delta):
	if Input.is_action_just_pressed("ui_pause"):
		pauseMenu()
		
func sceneSelector():
	match Globals.current_scene:	
		Globals.sceneType.farm:
			get_tree().change_scene_to_packed(farm_scene)
		Globals.sceneType.wilderness:
			get_tree().change_scene_to_packed(wilderness_scene)

func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else: 
		pause_menu.show()
		Engine.time_scale = 0
		
	paused = !paused
