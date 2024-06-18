extends Node

var farm_state: Array[ItemData] = []
var max_plant_phase: int = 3

enum SeedType {
	oak,
	beech,
	birch,
	hornbeam,
	elm
}

class ItemData:
	var calculated_milestones: Array
	var coordinates: Vector2i
	var current_growth_phase: int
	var date_of_sowing: int
	var growth_phase_length: int
	var growth_steps: int
	var is_harvestable: bool
	var seed_type: SeedType
	
	func _init(calculated_milestones: Array, coordinates: Vector2i, current_growth_phase: int, date_of_sowing: int, growth_steps: int, growth_phase_length: int, is_harvestable: bool, seed_type: SeedType) -> void:
		self.calculated_milestones = calculated_milestones
		self.coordinates = coordinates
		self.current_growth_phase = current_growth_phase
		self.date_of_sowing = date_of_sowing
		self.growth_phase_length = growth_phase_length
		self.growth_steps = growth_steps
		self.is_harvestable = is_harvestable
		self.seed_type = seed_type
		

func add_item(calculated_milestones: Array, coordinates: Vector2i, current_growth_phase: int, date_of_sowing: int, growth_phase_length: int, growth_steps: Array, is_harvestable: bool, seed_type: SeedType) -> void:
	var new_item = ItemData.new(calculated_milestones, coordinates, current_growth_phase, date_of_sowing, growth_phase_length, growth_steps, is_harvestable, seed_type)
	farm_state.push_back(new_item)

func remove_item() -> void:
	pass		

func update_phase() -> void:
	
	pass

#zasadim seminkio, nactu konfiguraci z static_data
		#seminko ma 3 faze, dohromady trva rust 6 dni
		# seminko rostlinka sklizen
		#1 faze = 2 dny
		
		
		
		#switchne se den z 10. na 11.
		#projdu farm_state 
		#1. seminko - plant day = 10. 
			#faze_rosliny = 
		#
			#growth_period / growth_step = delka 1 faze
			#zacatek_2_faze = 10 + 2 = 12.
			#sklizen = 10 + 4 = 14.
			#
			#faze_rostliny = 1. faze - 10 + delka_faze, 2. faze - 10 + 2. delka_faze
			#
			#faze_rostliny [12, 14]
			#
			#10. - current_phase = 0
			#11. -
			#12. najit 12 v te mnozine, current_phase + 1
			#13. -
			#14. current_phase +1 = current_phase = 2 => isHarvestable = true && nastav finalni sprite
			#15. 
			#
			#
			#kliknes current_phase < 2 => odstran to co je na tilu, pokud current_phase =2 => sklid (das jinej sprite, do inventare dej seminko, plod)
			#
