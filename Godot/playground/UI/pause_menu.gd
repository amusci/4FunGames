extends Control


@onready var main = $"../../"

func _on_resume_pressed():
	# Resume game
	main.pause_menu()

func _on_level_select_pressed():
	# Send to level select
	Engine.time_scale = 1
	TransitionScreen.transition()
	await get_tree().create_timer(.5).timeout
	print("Changing scene to level select")
	get_tree().change_scene_to_file("res://UI/level_select.tscn")

	

func _on_quit_pressed():
	# Quit out of game
	get_tree().quit()

