extends CharacterBody2D

const GRAVITY : int = 1000
# setting gravity constant

enum State { idle, run } 
# amount of states that the player can be in

var current_state = State.idle
# make variable that allows the current state to start at idle

func _ready():
	# Ready function is called at the very beginning, only once.
	pass

func _physics_process(delta):
	# Function called every physics frame.
	player_falling(delta)
	player_idle(delta)
	
	move_and_slide()

func player_falling(delta):
	# Gravity function
	if !is_on_floor():
		velocity.y += GRAVITY * delta
		
		
func player_idle(delta):
	# Function to set the state of the player to idle
	if is_on_floor():
		current_state = State.idle
