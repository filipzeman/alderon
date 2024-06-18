extends CharacterBody2D

var health_bar_label
var energy_bar_label
var notification_label

func _physics_process(delta):
	move(delta)
	move_and_slide()

func _ready() -> void:

	#$AnimationPlayer.play('main_character_default')
	energy_bar_label = get_parent().get_node("HUD/EnergyBar/EnergyValue")
	health_bar_label = get_parent().get_node("HUD/HealthBar/HealthValue")
	notification_label = get_parent().get_node("HUD/Notification/NotificationInfo")

	energy_bar_label.text = str(Globals.player_current_stamina)
	health_bar_label.text = str(Globals.player_current_health)
	
func update_health():
	if Globals.player_current_health > 0:
		Globals.player_current_health -= 1
		health_bar_label.text = str(Globals.player_current_health)
		
	#handle situation when player has 0 health
	if Globals.player_current_health == 0:
		$Timer.stop()
		Engine.time_scale = 0
		notification_label.text = str("You are doomed, you foolish spirit")

func move(delta):
	velocity = Vector2.ZERO
	var dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = (dir * Vector2(48,24)) * Globals.player_default_speed * Globals.player_speed_multiplier * delta

func _on_timer_timeout():
	update_health()
	pass
	
