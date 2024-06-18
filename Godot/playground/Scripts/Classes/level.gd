class_name Level

extends Node

'''@export var level_id : int
@export var level_start_pos : Node2D

var level_data : LevelData'''
@onready var pausemenu = $UI/pause_menu
var paused : bool = false

func _ready() -> void:
	#level_data = LevelManager.get_level_data_by_id(level_id)
	pausemenu.hide()
	
	

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pause_menu()
		
func pause_menu():
	if paused:
		pausemenu.hide()
		Engine.time_scale = 1
	else:
		pausemenu.show()
		Engine.time_scale = 0
		
	paused = !paused
	
