
extends Panel

var coins : int = 0 

func _ready() -> void:
	var playernode = get_tree().get_root().find_child("Player", true, false)
	playernode.connect("coin_collected", coin_collected)

func coin_collected() -> void:
	# Increment coins by 1
	coins += 1
	$coins_collected.text = "Coins Collected: " + str(coins)
