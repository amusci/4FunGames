class_name Level

extends Node

@onready var pausemenu = $UI/PauseMenu
@onready var level_music = get_tree().get_root().find_child("level_music", true, false)
var paused : bool = false
var music_position = 0

func _ready() -> void:
	MusicManager.stop_music() # Start with main menu music off
	pausemenu.hide() # Pause menu hidden
	
func _process(delta):
	if Input.is_action_just_pressed("pause"): # If we press Esc
		pause_menu() # Pause the game and show pause menu
		
func pause_menu():
	if paused: # If we want to pause
		pausemenu.show() # Show the pause menu 
		music_position = level_music.get_playback_position() # Get the level's music position
		level_music.stop() # Stop the music
		Engine.time_scale = 0 # Stop the Game Engine
	else:
		pausemenu.hide() # If we aren't paused, hide the pause menu
		Engine.time_scale = 1 # Start Game Engine
		level_music.play(music_position) # Play music from the paused position
		
	paused = !paused # BOOLEAN BOOLEAN BOOLEAN BOOLEAN BOOLEAN BOOLEAN BOOLEAN BOOLEAN BOOLEAN BOOLEAN 

