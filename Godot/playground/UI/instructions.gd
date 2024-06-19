extends Control


func _on_back_pressed():
	TransitionScreen.transition()
	await get_tree().create_timer(.5).timeout
	print("Changing scene to level select")
	get_tree().change_scene_to_file("res://UI/main_scene.tscn")

