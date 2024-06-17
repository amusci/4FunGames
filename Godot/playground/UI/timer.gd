extends Panel

var time: float = 0.0
var minutes: int = 0
var seconds: int = 0
var msec: int = 0

func _process(delta):
	var playernode = get_tree().get_root().find_child("Player", true, false)
	playernode.connect("player_death", reset_timer)
	start_timer(delta)
	
func start_timer(delta) -> void:
	time += delta
	msec = fmod(time, 1) * 100
	seconds = fmod(time, 60)
	minutes = fmod(time, 3600) / 60
	$minutes.text = "%02d:" % minutes
	$seconds.text = "%02d." % seconds
	$milli.text = "%02d" % msec
		
func reset_timer():
	time = 0
	minutes = 0
	seconds = 0
	msec = 0
	
func get_time_formatted() -> String:
	return "%02d:%02d.%03d" % [minutes, seconds, msec]
