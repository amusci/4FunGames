extends Control


func _on_back_pressed():
	# Back to main menu
	TransitionScreen.transition()
	await get_tree().create_timer(.5).timeout
	print("Changing scene to main menu")
	get_tree().change_scene_to_file("res://UI/main_scene.tscn")



func _on_sfx_test_pressed():
	SFXManager.coinsfx.play()
	
