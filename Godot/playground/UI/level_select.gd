extends Control


func _ready():
	# Check medals for all levels
	check_level_medal("LevelOne", MedalManager.level_one_medal, "LevelOneBronze", "LevelOneSilver", "LevelOneGold")
	check_level_medal("LevelTwo", MedalManager.level_two_medal, "LevelTwoBronze", "LevelTwoSilver", "LevelTwoGold")
	check_level_medal("LevelThree", MedalManager.level_three_medal, "LevelThreeBronze", "LevelThreeSilver", "LevelThreeGold")
	check_level_medal("LevelFour", MedalManager.level_four_medal, "LevelFourBronze", "LevelFourSilver", "LevelFourGold")
	check_level_medal("LevelFive", MedalManager.level_five_medal, "LevelFiveBronze", "LevelFiveSilver", "LevelFiveGold")
	check_level_medal("LevelSix", MedalManager.level_six_medal, "LevelSixBronze", "LevelSixSilver", "LevelSixGold")

func check_level_medal(level_name: String, medal: String, bronze_name: String, silver_name: String, gold_name: String):
	if medal == "bronze":
		var bronze = get_tree().get_root().find_child(bronze_name, true, false)
		if bronze:
			bronze.visible = true
	elif medal == "silver":
		var silver = get_tree().get_root().find_child(silver_name, true, false)
		if silver:
			silver.visible = true
	elif medal == "gold":
		var gold = get_tree().get_root().find_child(gold_name, true, false)
		if gold:
			gold.visible = true
		
			

func _on_level_1_pressed():
	# Function loads the first level
	TransitionScreen.transition()
	await get_tree().create_timer(.5).timeout
	print("Changing scene to level 1")
	get_tree().change_scene_to_file("res://levels/level_cinematics/level_one_cine.tscn")
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
	get_tree().change_scene_to_file("res://levels/level_cinematics/level_four_cine.tscn")
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
	get_tree().change_scene_to_file("res://levels/level_cinematics/level_six_cine.tscn")
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
