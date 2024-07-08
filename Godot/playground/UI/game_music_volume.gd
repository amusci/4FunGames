extends HSlider

func _value_changed(new_value):	
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("game_music"),linear_to_db(new_value)) # Change game music bus
	
		

		
	
