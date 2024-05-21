extends CharacterBody2D

@export var player_crafting_energy : int = 0
@export var player_health: int = 100
@export var player_health_limit: int = 100
@export var player_speed : int = 140
var player_alive: bool
var actual_player_crafting_energy: int
var actual_player_health: int
var health_bar_label
var energy_bar_label
var notification_label

func _physics_process(delta):
	move(delta)
	move_and_slide()

func _ready() -> void:
	player_alive = true
	$AnimationPlayer.play('main_character_default')
	energy_bar_label = get_parent().get_node("HUD/EnergyBar/EnergyValue")
	health_bar_label = get_parent().get_node("HUD/HealthBar/HealthValue")
	notification_label = get_parent().get_node("HUD/Notification/NotificationInfo")

	actual_player_health = player_health
	actual_player_crafting_energy = player_crafting_energy
	energy_bar_label.text = str(actual_player_crafting_energy)
	health_bar_label.text = str(actual_player_health)
	
func update_health():
	if actual_player_health > 0:
		actual_player_health -= 1
		health_bar_label.text = str(actual_player_health)
		
	if actual_player_health == 0:
		$Timer.stop()
		Engine.time_scale = 0
		#notification_label.text = str("You are doomed, you foolish spirit")

func move(delta):
	velocity = Vector2.ZERO
	var dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if (dir.x != 0) and (dir.y != 0):
		velocity = (dir * Vector2(48,24)) * player_speed * delta

func _on_timer_timeout():
	update_health()
	
