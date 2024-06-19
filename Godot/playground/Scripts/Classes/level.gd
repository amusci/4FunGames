class_name Level

extends Node

@onready var pausemenu = $UI/pause_menu
var paused : bool = false

func _ready() -> void:
	MusicManager.stop_music()
	pausemenu.hide()
	
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pause_menu()
		
func pause_menu():
	if paused:
		pausemenu.hide()
		Engine.time_scale = 1
	else:
		pausemenu.show()
		Engine.time_scale = 0
		
	paused = !paused
	
