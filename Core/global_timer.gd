extends Node

# Define time variables
#var seconds : int = 0
var minutes : int = 0
var hours : int = 0
var days : int = 10
var months : int = 0
var years : int = 0
#1 ingame minute = 1 realtime second, 1 ingame hour = 24 realtime minutes
var multiplier : int = 100 

# Define timer node
@onready var timer: Timer = Timer.new()

# Define month lengths (simplified, ignoring leap years for now)
var month_lengths := [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

func _ready():
	timer.wait_time = 1.0
	add_child(timer)
	timer.timeout.connect(_on_Timer_timeout)
	timer.start()

func _on_Timer_timeout():
	minutes += 1 * multiplier

	if minutes >= 60:
		minutes = 0
		hours += 1

	if hours >= 24:
		hours = 0
		days += 1

		FarmState.update_phase()

	# Check for end of month
	if days >= month_lengths[months]:
		days = 0
		months += 1

	# Check for end of year
	if months >= 12:
		months = 0
		years += 1

	# Restart the timer
	timer.start()

