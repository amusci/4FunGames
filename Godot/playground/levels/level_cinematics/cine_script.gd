extends Node

@onready var cine_player = get_tree().get_root().find_child("cinematic_player", true, false)
@onready var timer_label = get_tree().get_root().find_child("timer_label", true, false)

var space_hold_time = 0.0  # Timer to track spacebar hold duration
var in_cine_time : float = 0.0

@export var skip_time : int = 3
@export var scene_to_send : String
@export var cine_finish_time : int

func _ready():
	MusicManager.stop_music() # Start with main menu music off
	cine_player.play("opening_cine")


func _physics_process(delta):
	in_cine_time += delta
	print(in_cine_time)
	timer_label.set_text("HOLD SPACEBAR TO SKIP CINEMATIC: " + str(round(space_hold_time)))
	if Input.is_action_pressed("jump"): # If spacebar is held
		space_hold_time += delta # Increment Timer
		#print(space_hold_time)
		
		if space_hold_time >= skip_time:
			TransitionScreen.transition()
			await get_tree().create_timer(.5).timeout

			get_tree().change_scene_to_file(scene_to_send)
			space_hold_time = 0.0  # Reset the timer after printing
	else:
		space_hold_time = 0.0  # Reset the timer if the spacebar is released
	
	if in_cine_time >= cine_finish_time:
		TransitionScreen.transition()
		await get_tree().create_timer(.5).timeout
		get_tree().change_scene_to_file(scene_to_send)

