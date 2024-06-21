class_name MainMenu
extends Control

func _on_play_button_pressed():
	TransitionScreen.transition()
	await get_tree().create_timer(.5).timeout
	print("Changing scene to level select")
	get_tree().change_scene_to_file("res://UI/level_select.tscn")
	deactivate() # Line 21
	
	
func _on_instructions_pressed():
	TransitionScreen.transition()
	await get_tree().create_timer(.5).timeout
	print("Changing scene to instructions")
	get_tree().change_scene_to_file("res://UI/instructions.tscn")
	deactivate() # Line 21

func _on_settings_pressed():
	TransitionScreen.transition()
	await get_tree().create_timer(.5).timeout
	print("Changing scene to settings")
	get_tree().change_scene_to_file("res://UI/settings.tscn")
	deactivate() # Line 21
	

func _on_quit_button_pressed():
	# This function when pressed quits the game
	get_tree().quit()


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




