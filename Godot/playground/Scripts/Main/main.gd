extends Node

# Autoload the AudioManager scene in Project Settings -> Autoload
@onready var audio_manager = get_tree().get_root().find_child("MusicManager", true, false)

func _ready():
	# Example: Play music when the main scene is ready
	audio_manager.play_music()
	
	
