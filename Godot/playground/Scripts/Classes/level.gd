class_name Level

extends Node

@export var silver : float = 0.0
@export var gold : float = 0.0


@onready var pausemenu = $UI/PauseMenu
@onready var level_music = get_tree().get_root().find_child("level_music", true, false)
var paused : bool = true
var music_position = 0
var level_timer : float = 0.0
var level_complete : bool = false

signal medal_awarded


func _ready() -> void:
	var level = get_tree().get_root().find_child("finish_flag", true, false)
	level.connect("player_reached_flag", _on_player_reached_flag)
	MusicManager.stop_music() # Start with main menu music off
	pausemenu.hide() # Pause menu hidden
	
func _physics_process(delta):
	if not level_complete and paused:
		level_timer += delta
		#print(level_timer)
	
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

func check_time(level_timer) -> String:
	if level_timer < gold:
		return "gold"
	elif gold < level_timer and level_timer < silver:
		return "silver"
	else:
		return "bronze"
		
func _on_player_reached_flag():
	level_complete = true
	print("level finished in ", level_timer)
	var medal = check_time(level_timer)
	if get_name() == "LevelOne":
		MedalManager.level_one_medal = medal
	elif get_name() == "LevelTwo":
		MedalManager.level_two_medal = medal
	elif get_name() == "LevelThree":
		MedalManager.level_three_medal = medal
	elif get_name() == "LevelFour":
		MedalManager.level_four_medal = medal
	elif get_name() == "LevelFive":
		MedalManager.level_five_medal = medal
	elif get_name() == "LevelSix":
		MedalManager.level_six_medal = medal
	
	
	
	
		
	
