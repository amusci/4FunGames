class_name MainMenu
extends Control



func _on_play_button_pressed():
	# Function loads the first level
	TransitionScreen.transition()
	LevelManager.load_level(1)
	await TransitionScreen.on_transition_finished
	deactivate() # Line 21


func _on_settings_button_pressed():
	# Function open settings
	pass


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
