extends PanelContainer

# Initalizing time variables

var time: float = 0.0
var minutes: int = 0
var seconds: int = 0
var msec: int = 0

func _ready() -> void:
	# This function gets the player node, then connects the signal
	var playernode = get_tree().get_root().find_child("Player", true, false)
	if playernode:
		
		playernode.connect("add_time", _add_time) # Connect signal

func _physics_process(delta):
	start_timer(delta)

func start_timer(delta) -> void:
	# This function handles the timer
	time += delta
	msec = int(fmod(time * 1000, 1000))
	seconds = int(fmod(time, 60))
	minutes = int(fmod(time / 60, 60))
	$timer.text = get_time_formatted()

func _add_time():
	print('time added in timer')
	time += 10

'''func reset_timer():
	# When player dies, this function is called to reset the timer
	await get_tree().create_timer(.5).timeout
	time = 0
	minutes = 0
	seconds = 0
	msec = 0
	$timer.text = get_time_formatted()
	'''
	
func get_time_formatted() -> String:
	# Helper function
	return "%02d:%02d.%03d" % [minutes, seconds, msec]
