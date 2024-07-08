extends Area2D

func _on_body_entered(body):
	if body is Player:
		print(get_name()+ " hit!")
		var area_position = self.position  # Get the position of the Area2D
		body.respawn_area = area_position
		queue_free()
		

