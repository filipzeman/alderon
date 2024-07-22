extends Node

# Define time variables
#var seconds : int = 0
var minutes : int = 0
var hours : int = 0
var days : int = 1
var months : int = 0
var years : int = 0
#1 ingame minute = 1 realtime second, 1 ingame hour = 24 realtime minutes
var multiplier : int =  1

# Define timer node
@onready var timer: Timer = Timer.new()

# Define month lengths (simplified, ignoring leap years for now)
var month_length = 10

func _ready():
	timer.wait_time = 1.0
	add_child(timer)
	timer.timeout.connect(_on_Timer_timeout)
	timer.start()

func _on_Timer_timeout():
	minutes += 1 * multiplier
	print('new minute')
	

	if minutes >= 60:
		minutes = 0
		hours += 1
		print('new hour')
		

	if hours >= 24:
		hours = 0
		days += 1

		FarmState.update_phase()
		print('new day', days)

	# Check for end of month
	if days >= month_length:
		days = 0
		months += 1

	# Check for end of year
	if months >= 13:
		months = 0
		years += 1

	# Restart the timer
	timer.start()

