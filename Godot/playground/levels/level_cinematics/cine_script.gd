extends Node

@onready var cine_player = get_tree().get_root().find_child("cinematic_player", true, false)
@onready var timer_label = get_tree().get_root().find_child("timer_label", true, false)

var space_hold_time = 0.0  # Timer to track spacebar hold duration

@export var skip_time : int = 3

func _ready():
	MusicManager.stop_music() # Start with main menu music off
	cine_player.play("opening_cine")
	

func _physics_process(delta):
	timer_label.set_text("Press Spacebar to Skip Cinematic: " + str(round(space_hold_time)))
	if Input.is_action_pressed("jump"): # If spacebar is held
		space_hold_time += delta # Increment Timer
		print(space_hold_time)
		   
		if space_hold_time >= skip_time:
			TransitionScreen.transition()
			await get_tree().create_timer(.5).timeout
			print("Changing scene to level 3")
			get_tree().change_scene_to_file("res://levels/level_three.tscn")
		
			space_hold_time = 0.0  # Reset the timer after printing
	else:
		space_hold_time = 0.0  # Reset the timer if the spacebar is released
