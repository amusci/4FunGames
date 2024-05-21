extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D # reference to AnimatedSprite2D node

const GRAVITY : int = 1000
# setting gravity constant
const SPEED : int = 300
# setting speed constant
const JUMPHEIGHT : int = -500
# setting jumpheight constant
const JUMPSPEED : int = 300
# setting jumpspeed constant

enum State { idle, run, jump} 
# amount of states that the player can be in

var current_state = State.idle
# make variable that allows the current state to start at idle

func _ready():
	# Ready function is called at the very beginning, only once.
	pass

func _physics_process(delta):
	# Function called every physics frame.
	print("Current State: ", State.keys()[current_state])
	player_falling(delta)
	player_idle(delta)
	player_run(delta)
	player_jump(delta)
	
	move_and_slide()
	
	player_animations()

func player_falling(delta):
	# Gravity function
	if !is_on_floor():
		velocity.y += GRAVITY * delta
		
		
func player_idle(delta):
	# Function to set the state of the player to idle
	if is_on_floor():
		current_state = State.idle
		
		
func player_run(delta):
	if !is_on_floor():
		# if jumping / falling, we dont want our run to be called
		return
	# Function handles player run
	var direction = Input.get_axis("move_left","move_right") # get left and right inputs
	print(direction) # left = -1, right = 1, nothing = 0
	if direction: # if there's left and right input
		velocity.x = direction * SPEED # multiply speed to that direction
	else: # if there's no input
		velocity.x = move_toward(velocity.x, 0, SPEED) # move towards 0 
		
	if direction != 0: # if we are moving
		current_state = State.run # change state to run
		
		if direction > 0: # if direction is right
			animated_sprite_2d.flip_h = false # no need to touch sprite
		else: # if direction is left
			animated_sprite_2d.flip_h = true # flip sprite
			
func player_jump(delta):
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPHEIGHT
		current_state = State.jump
		
	
	if !is_on_floor() and current_state == State.jump:
		var direction = Input.get_axis("move_left","move_right") # get left and right inputs
		velocity.x += direction * JUMPSPEED * delta
		
func player_animations():
	# animations depending on state
	if current_state == State.idle:
		animated_sprite_2d.play("idle")
	elif current_state == State.run and is_on_floor():
		# make sure that x axis movement in air stays as jump state
		animated_sprite_2d.play("player_run")
	elif current_state == State.jump:
		animated_sprite_2d.play("player_jump")
	
		
		
