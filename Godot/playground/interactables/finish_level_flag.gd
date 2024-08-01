extends Node

@export var desired_scene : String = "" # Allow us to change scenes in inspector
@export var which_level : String = ""
@export var num_of_coins : int = 0


signal player_reached_flag

var entered : bool = false # Set flag to false

func _on_area_2d_body_entered(body)-> void:
	if body.is_in_group("Player") and body.collected_coins >= num_of_coins:
		print("Player can finish the level!")
		emit_signal("player_reached_flag") # Signal emit
		# Implement your logic for finishing the level
		if desired_scene != "":
			TransitionScreen.transition()
			await get_tree().create_timer(.5).timeout
			print("Changing scene to: " + desired_scene)
			get_tree().change_scene_to_file(desired_scene) # Change to desired scene
		else:
			print("Error: desired_scene is not set.")
	else:
		print("Player needs to collect more coins to finish the level.")


	
	
