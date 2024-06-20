class_name Level

extends Node

@onready var pausemenu = $UI/pause_menu
@onready var level_one_music = get_tree().get_root().find_child("level_one_music", true, false)
var paused : bool = false
var music_position = 0

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
		level_one_music.play(music_position)
	else:
		pausemenu.show()
		music_position = level_one_music.get_playback_position()
		level_one_music.stop()
		Engine.time_scale = 0
		
	paused = !paused

