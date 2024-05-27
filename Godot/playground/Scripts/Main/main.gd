extends Node

@export var available_levels : Array[LevelData]

@onready var node_2d = $Node2D

func _ready() -> void:
	LevelManager.main_scene = node_2d # set the current level to the Node2D
	LevelManager.levels = available_levels # hold available levels
	

