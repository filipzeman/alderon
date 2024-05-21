extends Node

var game = {}

@onready var player_data = $"../Player"

func _ready() -> void :
	var player = {
		"name": "Japhy",
		"health": player_data.act
	}


	

