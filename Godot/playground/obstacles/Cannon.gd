extends Node2D

@onready var main = get_tree().get_root().get_node(level)
@onready var projectile = load("res://obstacles/egg_projectile.tscn")
@onready var shoot_speed = $shoot_speed


@export var level: String
#@export var rotation_of_cannon: int = 45
@export var direction_of_bullet : int = 0
@export var shot_speed : int = 0

# 0 = right
# 45 = down right
# 90 = down
# 135 = down left
# 180 = left
# 225 = up left
# 270 = up
# 315 = up right
# 360 = right
# USE THIS TO CREATE YOUR OWN ANGLES. ANY NUMBER BETWEEN 0-360 IS USABLE


func _ready():
	shoot_speed.wait_time = shot_speed
	shoot_speed.start()

func _physics_process(delta):
	pass
	#rotation_degrees += rotation_of_cannon * delta # This would make the cannon rotate
	#shoot_speed.wait_time
	
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
