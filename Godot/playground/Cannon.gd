extends Node2D

@onready var main = get_tree().get_root().get_node("main")
@onready var projectile = load("res://obstacles/egg_projectile.tscn")

func _ready():
	shoot()

func shoot():
	var instance = projectile.instantiate()
	instance.dir = rotation
	instance.spawnPos = global_position
	instance.spawnRot = rotation
	main.add_child.call_deferred(instance)
