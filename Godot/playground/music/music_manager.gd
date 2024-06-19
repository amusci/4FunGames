extends Node

const bg_music_path = "res://music/outoflevel/Freestyle.mp3"

@onready var audio_player = $AudioPlayer


func play_music():
	# Only play music if it's not already playing
	if !audio_player.playing:
		audio_player.stream = preload(bg_music_path)
		audio_player.play()

func stop_music():
	audio_player.stop()
