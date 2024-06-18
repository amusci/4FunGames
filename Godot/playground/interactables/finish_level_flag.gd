extends Area2D

@export var desired_scene : String = "" # Allow us to change scenes in inspector

var entered : bool = false # Set flag to false

func _on_body_entered(body: Node): # If player enters collision radius
	if body.is_in_group("Player"): # Ensure it's the player
		entered = true # Flag set to true

func _on_body_exited(body: Node): # If player leaves collision radius
	if body.is_in_group("Player"): # Ensure it's the player
		entered = false # Flag set to false

func _physics_process(delta: float):
	# This function will handle the scene switching
	if entered:
		TransitionScreen.transition()
		await get_tree().create_timer(.5).timeout
		print("Player entered the Area2D")
		# Implement your scene switching logic here
		if desired_scene != "":
			print("Changing scene to: " + desired_scene)
			get_tree().change_scene_to_file(desired_scene) # Change to desired scene
		else:
			print("Error: desired_scene is not set.")
