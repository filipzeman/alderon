extends Node

class_name PlantClass

var calculated_milestones: Array
var coordinates: Vector2i
var current_growth_phase: int
var date_of_sowing: int
var growth_phase_length: int
var growth_steps: int
var is_harvestable: bool
var seed_type: SeedType

enum SeedType {
	oak,
	beech,
	birch,
	hornbeam,
	elm
}

func _init(new_calculated_milestones: Array, new_coordinates: Vector2i, new_current_growth_phase: int, new_date_of_sowing: int, new_growth_steps: int, new_growth_phase_length: int, new_is_harvestable: bool, new_seed_type: SeedType):
	calculated_milestones = new_calculated_milestones
	coordinates = new_coordinates
	current_growth_phase = new_current_growth_phase
	date_of_sowing = new_date_of_sowing
	growth_phase_length = new_growth_phase_length
	growth_steps = new_growth_steps
	is_harvestable = new_is_harvestable
	seed_type = new_seed_type