extends Area2D

# Signal for body entering this area



func _on_body_entered(body):
	if body is Player:
		body.handle_death()
