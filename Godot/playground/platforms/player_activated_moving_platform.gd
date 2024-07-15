extends Path2D

'''

A NOTE FROM THE GOAT!

If you want the platform to move in a closed path (a shape or something)
turn LOOP ON in the inspector.

If the platform is moving in an unclosed path (a line or something) turn Loop OFF.

'''

# Inspector Variables

@export var loop = true
@export var speed = 2.0
@export var speed_scale = 1.0

# Get the specific nodes

@onready var path = $PathFollow2D
@onready var animation = $AnimationPlayer
var on_platform: bool = false


func _ready():
	
	# Make sure animation plays
	if not loop:
		animation.play("move_left_to_right")
		animation.speed_scale = speed_scale
		set_process(false)

func _physics_process(delta):
	# Make sure progress increments
	if on_platform == true:
		await get_tree().create_timer(.5).timeout
		path.progress += speed
		
	
	
	


func _on_area_2d_body_entered(body):
	if body is Player: 
		print("standing")
		on_platform = true
	
