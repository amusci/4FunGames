extends Panel

# Initalizing time variables

var time: float = 0.0
var minutes: int = 0
var seconds: int = 0
var msec: int = 0

func _process(delta):
	# This function gets the player node, then connects the signal
	var playernode = get_tree().get_root().find_child("Player", true, false)
	playernode.connect("player_death", reset_timer)
	start_timer(delta)
	
func start_timer(delta) -> void:
	# This function handles the timer
	time += delta
	msec = fmod(time, 1) * 100
	seconds = fmod(time, 60)
	minutes = fmod(time, 3600) / 60
	$minutes.text = "%02d:" % minutes
	$seconds.text = "%02d." % seconds
	$milli.text = "%02d" % msec
		
func reset_timer():
	# When player dies, this function is called to reset the timer
	await get_tree().create_timer(1).timeout
	time = 0
	minutes = 0
	seconds = 0
	msec = 0
	
func get_time_formatted() -> String:
	# Helper function
	return "%02d:%02d.%03d" % [minutes, seconds, msec]
