extends CharacterBody2D

@export var SPEED = 50
@export var lifetime : int = 10


# Setting placeholder vars
var dir : Vector2
var spawnPos : Vector2
var spawnRot : float
var zdex : int


func _ready():
	
	# Setting vars if needed
	global_position = spawnPos
	global_rotation = spawnRot
	z_index = zdex
	
	$projectile_life_time.wait_time = lifetime
	$projectile_life_time.start()
	
func _physics_process(delta):
	velocity = Vector2(SPEED, 0).rotated(dir.angle()) # Get velocity of proj
	var collision = move_and_collide(velocity * delta) # Allow collisions
	if collision: # If collisions occur
		print('collision')
		queue_free() # Remove proj
	move_and_slide() # Move and slide 8)


func _on_area_2d_body_entered(body):
	# If proj hits player, kill player and remove proj
	if body is Player:
		print('HIT!')
		queue_free()
		body.handle_death()
	else:
		queue_free()


func _on_projectile_life_time_timeout():
	# If timer runs out, remove proj
	queue_free()
