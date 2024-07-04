extends Node

var farm_state: Array = []
		

func add_item(coordinates: Vector2i, current_growth_phase: int, date_of_sowing: int, growth_phase_length: int, growth_steps: int, is_harvestable: bool, seed_type: PlantClass.SeedType) -> void:
	var item_calculated_milestones = calculate_milestones(2, 3)
	var new_item = PlantClass.new(item_calculated_milestones, coordinates, current_growth_phase, date_of_sowing, growth_phase_length, growth_steps, is_harvestable, seed_type)
	farm_state.push_back(new_item)
	print(new_item.date_of_sowing)
	
func calculate_milestones(growth_phase_length, growth_steps):
	var calculated_milestones: Array = []
	
	for index in growth_steps:
		var milestone = str(GlobalTimer.days + growth_phase_length)
		calculated_milestones.push_back(milestone)
		# print(milestone)
		
	return calculated_milestones
	

func remove_item() -> void:
	pass		

func update_phase() -> void:
	# for item in farm_state:
	pass

	

##zasadim seminkio, nactu konfiguraci z static_data
		##seminko ma 3 faze, dohromady trva rust 6 dni
		## seminko rostlinka sklizen
		##1 faze = 2 dny
		#
		#
		#
		##switchne se den z 10. na 11.
		##projdu farm_state 
		##1. seminko - plant day = 10. 
			##faze_rosliny = 
		##
			##growth_period / growth_step = delka 1 faze
			##zacatek_2_faze = 10 + 2 = 12.
			##sklizen = 10 + 4 = 14.
			##
			##faze_rostliny = 1. faze - 10 + delka_faze, 2. faze - 10 + 2. delka_faze
			##
			##faze_rostliny [12, 14]
			##
			##10. - current_phase = 0
			##11. -
			##12. najit 12 v te mnozine, current_phase + 1
			##13. -
			##14. current_phase +1 = current_phase = 2 => isHarvestable = true && nastav finalni sprite
			##15. 
			##
			##
			##kliknes current_phase < 2 => odstran to co je na tilu, pokud current_phase =2 => sklid (das jinej sprite, do inventare dej seminko, plod)