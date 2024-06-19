extends Area2D

@onready var anim_sprite = $AnimatedSprite2D

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Player"): # If body is Player
		SFXManager.coinsfx
		body.call_deferred("increment_coin_count") # Increment coin count
		anim_sprite.visible = false # Hide the coin since it's collected
		queue_free() # Destroy the coin instance since it's collected
