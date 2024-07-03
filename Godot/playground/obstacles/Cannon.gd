extends Node2D


@export var level: String
@export var rotation_of_cannon: int = 45
@export var direction_of_bullet : int = 335
# 0 = left
# 45 = down left
# 90 = down
# 135 = down right
# 180 = left
# 225 = up left
# 270 = up
# 315 = top right
# 360 = left
# USE THIS TO CREATE YOUR OWN ANGLES. ANY NUMBER BETWEEN 0-360 IS USABLE


@onready var main = get_tree().get_root().get_node(level)
@onready var projectile = load("res://obstacles/egg_projectile.tscn")

func _physics_process(delta):
	#rotation_degrees += rotation_of_cannon * delta # This would make the cannon rotate
	pass
	
func angle_to_vector(angle_deg):
	var angle_rad = deg_to_rad(angle_deg)
	return Vector2(cos(angle_rad), sin(angle_rad)).normalized()

func shoot():
	var proj = projectile.instantiate() # Allow us to use our projectile
	proj.dir = angle_to_vector(direction_of_bullet)
	proj.spawnPos = global_position + Vector2(0,0) # Spawn position
	proj.spawnRot = rotation # Set rotation of projectile
	#proj.zdex = z_index - 1 # Might do something for this idk
	main.add_child.call_deferred(proj) # Spawn in the projectile

func _on_shoot_speed_timeout():
	shoot() # 1 Second


func _on_life_time_timeout():
	queue_free()
