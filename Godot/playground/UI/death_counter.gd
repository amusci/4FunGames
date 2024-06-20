extends PanelContainer

var deaths : int = 0 

func _ready() -> void:
	var player_node = get_tree().get_root().find_child("Player", true, false)
	if player_node:
		player_node.disconnect("increment_death", increment_deaths)
		player_node.connect("increment_death", increment_deaths)


func increment_deaths():
	# Increment deaths by 1
	deaths += 1
	print('hit')
	print("Deaths:", deaths)
	$deaths.text = "Deaths: %d" % deaths
