extends Area2D

func _on_body_entered(body):
	if body.is_in_group("Player"):
		
		print('yellow')
		if not body.climbing:
			body.climbing = true



func _on_body_exited(body):
	if body.is_in_group("Player"):
		print('let me out')
		body.climbing = false


