extends Area2D

@export var which_text : String

@onready var label = get_tree().get_root().find_child(which_text, true, false)
@onready var text_animations = get_tree().get_root().find_child("text_animations", true, false)

func _on_body_entered(body):
	if body is Player:
		if label:
			label.visible = true
			text_animations.play(which_text + "_fade_in")


func _on_body_exited(body):
	if body is Player:
		if label:
			text_animations.play(which_text + "_fade_out")
