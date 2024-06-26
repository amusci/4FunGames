extends Area2D

@export var spring_power : int = 800

func _on_body_entered(body: PhysicsBody2D):
	if body is Player:
		print('Player entered spring')
		var direction = rotation + PI / 2.0 # Capture direction
		body.spring(spring_power, direction) # Apply spring
		
		$AnimatedSprite2D.play("boing") # Play the animation
	else:
		$AnimatedSprite2D.play("idle")
