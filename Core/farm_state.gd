extends Node

var farm_state: Array[PlantClass] = []
		

func add_item(coordinates: Vector2i, current_growth_phase: int, date_of_sowing: int, growth_phase_length: int, growth_steps: int, is_harvestable: bool, seed_type: PlantClass.SeedType) -> void:
	var item_calculated_milestones = calculate_milestones(2, 3)
	var new_item: PlantClass = PlantClass.new(item_calculated_milestones, coordinates, current_growth_phase, date_of_sowing, growth_phase_length, growth_steps, is_harvestable, seed_type)
	farm_state.push_back(new_item)
	
func calculate_milestones(growth_phase_length, growth_steps):
	var calculated_milestones: Array = []
	var helper = GlobalTimer.days
	
	for index in growth_steps:
		var milestone = helper + growth_phase_length
		helper += growth_phase_length
		calculated_milestones.push_back(milestone)
		
	return calculated_milestones

func remove_item() -> void:
	pass

func update_phase():

	for item: PlantClass in farm_state:
		if item.current_growth_phase == item.growth_steps:
			return null
		
	
			
		if item.current_growth_phase  < item.growth_steps:
			for milestone in item.calculated_milestones:
				if milestone == GlobalTimer.days:
					item.current_growth_phase+= 1
					print('growth phase updated')
					print('new growth phase', item.current_growth_phase)
			if item.current_growth_phase == item.growth_steps:
				print('plant is ready for harvest')
