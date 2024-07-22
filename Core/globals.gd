extends Node

enum layers {
	terrain = 0,
	foliage = 1,
}

enum foliageType {
	flower, 
	seed, 
	seedling, 
	tree, 
	stone, 
	grass
}

enum sceneType {
	farm,
	wilderness,
	intro
}

var current_scene = sceneType.farm

var player_default_stamina:int = 100
var player_default_health:int = 100
var player_default_speed:int = 140
var player_default_level:int = 0

var player_alive:bool = true
var player_current_stamina:int = 100
var player_current_health:int = 100
var player_speed_multiplier:int = 1
var player_current_level:int = 0
