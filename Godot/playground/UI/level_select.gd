extends Control

func _on_level_1_pressed():
	# Function loads the first level
	TransitionScreen.transition()
	await get_tree().create_timer(.5).timeout
	print("Changing scene to level 1")
	get_tree().change_scene_to_file("res://levels/level_one.tscn")
	deactivate() # Line 42



func _on_level_2_pressed():
	pass # Replace with function body.


func _on_level_3_pressed():
	pass # Replace with function body.


func _on_level_4_pressed():
	pass # Replace with function body.


func _on_level_5_pressed():
	pass # Replace with function body.


func _on_level_6_pressed():
	pass # Replace with function body.


func _on_back_pressed():
	# Back to main menu
	TransitionScreen.transition()
	await get_tree().create_timer(.5).timeout
	print("Changing scene to level 1")
	get_tree().change_scene_to_file("res://UI/main_scene.tscn")
	deactivate() # Line 42
	

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
