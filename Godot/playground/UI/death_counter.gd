# TODO
# Fix improper incrementation

extends Panel

var deaths : int = 0 


func _process(delta):
	# This gets the player node and connects the signal
	var playernode = get_tree().get_root().find_child("Player", true, false)
	playernode.connect("increment_death", increment_deaths)

	
func increment_deaths():
	# Increment deaths by 1
	print(deaths)
	deaths += 1
	$deaths.text = "Deaths: " + "%d" % deaths
