extends CanvasLayer

signal on_transition_finished

# Get the nodes

@onready var color_rect = $ColorRect
@onready var animation_player = $AnimationPlayer


func _ready():
	# Make sure color rect is invisible by default and connect signals
	color_rect.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)
	
func _on_animation_finished(anim_name):
	# Function handles transition animations
	if anim_name == "fade_to_black": # If we want to fade to black, make sure we fade back to clear
		on_transition_finished.emit()
		animation_player.play("fade_to_clear")
	elif anim_name == "fade_to_clear": # If we are fading to clear, make the color rect inivisible 
		color_rect.visible = false
		
func transition():
	# If color rect is visible, make sure to fade to black
	color_rect.visible = true
	animation_player.play("fade_to_black")
	
