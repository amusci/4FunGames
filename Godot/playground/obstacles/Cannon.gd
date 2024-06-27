extends Node2D


@export var level: String
@export var rotation_of_cannon: int = 50

@onready var main = get_tree().get_root().get_node(level)
@onready var projectile = load("res://obstacles/egg_projectile.tscn")

func _physics_process(delta):
	#rotation_degrees += rotation_of_cannon * delta # This would make the cannon rotate
	pass

func shoot():
	var proj = projectile.instantiate() # Allow us to use our projectile
	proj.dir = rotation # Direction of projectile
	proj.spawnPos = global_position # Spawn position
	proj.spawnRot = rotation # Set rotation of projectile
	# instance.zdex = z_index - 1 # Might do something for this idk
	main.add_child.call_deferred(proj) # Spawn in the projectile

func _on_timer_timeout():
	shoot() # 1 Second
