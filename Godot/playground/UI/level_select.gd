extends Control

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
