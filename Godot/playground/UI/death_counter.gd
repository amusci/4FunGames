extends Panel

var deaths : int 

func _ready():
	deaths = 0

func _process(delta):
	var playernode = get_tree().get_root().find_child("Player", true, false)
	playernode.connect("increment_death", increment_deaths)
	# increment_deaths()
	
func increment_deaths():
	print(deaths)
	deaths += 1
	$deaths.text = "Deaths: " + "%d" % deaths
