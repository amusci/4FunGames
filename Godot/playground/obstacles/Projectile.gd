extends CharacterBody2D

@export var SPEED = 50

var dir : Vector2
var spawnPos : Vector2
var spawnRot : float
var zdex : int


func _ready():
	global_position = spawnPos
	global_rotation = spawnRot
	z_index = zdex
	
func _physics_process(delta):
	velocity = Vector2(SPEED, 0).rotated(dir.angle())
	var collision = move_and_collide(velocity * delta)
	if collision:
		queue_free()
	move_and_slide()


func _on_area_2d_body_entered(body):
	if body is Player:
		print('HIT!')
		queue_free()
		body.handle_death()



func _on_projectile_life_time_timeout():
	queue_free()
