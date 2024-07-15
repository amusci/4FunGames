extends Control


func _ready():
	if MedalManager.level_one_medal: # Level One
		if MedalManager.level_one_medal == "bronze":
			var LevelOneBronze = get_tree().get_root().find_child("LevelOneBronze", true, false)
			LevelOneBronze.visible = true
		elif MedalManager.level_one_medal == "silver":
			var LevelOneSilver = get_tree().get_root().find_child("LevelOneSilver", true, false)
			LevelOneSilver.visible = true
		elif MedalManager.level_one_medal == "gold":
			var LevelOneGold = get_tree().get_root().find_child("LevelOneGold", true, false)
			LevelOneGold.visible = true
	elif MedalManager.level_two_medal: # Level Two
		if MedalManager.level_two_medal == "bronze":
			var LevelTwoBronze = get_tree().get_root().find_child("LevelTwoBronze", true, false)
			LevelTwoBronze.visible = true
		elif MedalManager.level_two_medal == "silver":
			var LevelTwoSilver = get_tree().get_root().find_child("LevelTwoSilver", true, false)
			LevelTwoSilver.visible = true
		elif MedalManager.level_two_medal == "gold":
			var LevelTwoGold = get_tree().get_root().find_child("LevelTwoGold", true, false)
			LevelTwoGold.visible = true
	elif MedalManager.level_three_medal: # Level Three
		if MedalManager.level_three_medal == "bronze":
			var LevelThreeBronze = get_tree().get_root().find_child("LevelThreeBronze", true, false)
			LevelThreeBronze.visible = true
		elif MedalManager.level_three_medal == "silver":
			var LevelThreeBronze = get_tree().get_root().find_child("LevelThreeBronze", true, false)
			LevelThreeBronze.visible = true
		elif MedalManager.level_three_medal == "gold":
			var LevelThreeBronze = get_tree().get_root().find_child("LevelThreeBronze", true, false)
			LevelThreeBronze.visible = true
	elif MedalManager.level_four_medal: # Level Four
		if MedalManager.level_four_medal == "bronze":
			var LevelFourBronze = get_tree().get_root().find_child("LevelFourBronze", true, false)
			LevelFourBronze.visible = true
		elif MedalManager.level_four_medal == "silver":
			var LevelFourBronze = get_tree().get_root().find_child("LevelFourBronze", true, false)
			LevelFourBronze.visible = true
		elif MedalManager.level_four_medal == "gold":
			var LevelFourBronze = get_tree().get_root().find_child("LevelFourBronze", true, false)
			LevelFourBronze.visible = true
	elif MedalManager.level_five_medal: # Level Five
		if MedalManager.level_five_medal == "bronze":
			var LevelFiveBronze = get_tree().get_root().find_child("LevelFiveBronze", true, false)
			LevelFiveBronze.visible = true
		elif MedalManager.level_five_medal == "silver":
			var LevelFiveSilver = get_tree().get_root().find_child("LevelFiveSilver", true, false)
			LevelFiveSilver.visible = true
		elif MedalManager.level_five_medal == "gold":
			var LevelFiveGold = get_tree().get_root().find_child("LevelFiveGold", true, false)
			LevelFiveGold.visible = true
	elif MedalManager.level_six_medal: # Level Six
		if MedalManager.level_six_medal == "bronze":
			var LevelSixBronze = get_tree().get_root().find_child("LevelSixBronze", true, false)
			LevelSixBronze.visible = true
		elif MedalManager.level_six_medal == "silver":
			var LevelSixSilver = get_tree().get_root().find_child("LevelSixSilver", true, false)
			LevelSixSilver.visible = true
		elif MedalManager.level_six_medal == "gold":
			var LevelSixGold = get_tree().get_root().find_child("LevelSixGold", true, false)
			LevelSixGold.visible = true
		
			

func _on_level_1_pressed():
	# Function loads the first level
	TransitionScreen.transition()
	await get_tree().create_timer(.5).timeout
	print("Changing scene to level 1")
	get_tree().change_scene_to_file("res://levels/level_one.tscn")
	deactivate() # Line 67



func _on_level_2_pressed():
	# Function loads the second level
	TransitionScreen.transition()
	await get_tree().create_timer(.5).timeout
	print("Changing scene to level 2")
	get_tree().change_scene_to_file("res://levels/level_two.tscn")
	deactivate() # Line 67


func _on_level_3_pressed():
	# Function loads the third level
	TransitionScreen.transition()
	await get_tree().create_timer(.5).timeout
	print("Changing scene to level 3")
	get_tree().change_scene_to_file("res://levels/level_cinematics/level_three_cine.tscn")
	deactivate() # Line 67


func _on_level_4_pressed():
	# Function loads the fourth level
	TransitionScreen.transition()
	await get_tree().create_timer(.5).timeout
	print("Changing scene to level 4")
	get_tree().change_scene_to_file("res://levels/level_four.tscn")
	deactivate() # Line 67


func _on_level_5_pressed():
	# Function loads the fourth level
	TransitionScreen.transition()
	await get_tree().create_timer(.5).timeout
	print("Changing scene to level 5")
	get_tree().change_scene_to_file("res://levels/level_five.tscn")
	deactivate() # Line 67


func _on_level_6_pressed():
	# Function loads the sixth level
	TransitionScreen.transition()
	await get_tree().create_timer(.5).timeout
	print("Changing scene to level 6")
	get_tree().change_scene_to_file("res://levels/level_six.tscn")
	deactivate() # Line 67


func _on_back_pressed():
	# Back to main menu
	TransitionScreen.transition()
	await get_tree().create_timer(.5).timeout
	print("Changing scene to level 1")
	get_tree().change_scene_to_file("res://UI/main_scene.tscn")
	deactivate() # Line 67
	

func deactivate() -> void:
	# Function hides main menu
	hide()
	set_process(false)
	set_physics_process(false)
	set_process_unhandled_input(false)
	set_process_input(false)
	
func activate() -> void:
	# Function activates main menu
	show()
	set_process(true)
	set_physics_process(true)
	set_process_unhandled_input(true)
	set_process_input(true)
