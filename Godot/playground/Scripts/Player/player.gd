extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D # reference to AnimatedSprite2D node
@onready var slash_timer = $SlashTimer # reference to the Timer node

const GRAVITY : int = 1000
# setting gravity constant
const SPEED : int = 200
# setting speed constant
const JUMPHEIGHT : int = -350
# setting jumpheight constant
const JUMPSPEED : int = 100
# setting jumpspeed constant

enum State {idle,run,jump,slash} 
# amount of states that the player can be in

var current_state = State.idle
# make variable that allows the current state to start at idle

func _ready():
	# Ready function is called at the very beginning, only once.
	pass

func _physics_process(delta):
	# Function called every physics frame.
	# print("Current State: ", State.keys()[current_state])
	player_falling(delta)
	player_idle(delta)
	player_run(delta)
	player_jump(delta)
	player_slash(delta)
	
	move_and_slide()
	
	player_animations()

func player_falling(delta):
	# Gravity function
	if !is_on_floor(): # if not touching floor
		velocity.y += GRAVITY * delta # apply gravity
		
		
func player_idle(delta):
	# Function to set the state of the player to idle
	if is_on_floor() and current_state != State.slash: # if we are just chilling
		current_state = State.idle # idle
		
		
func player_run(delta):
	if !is_on_floor():
		# if jumping / falling, we dont want our run to be called
		return
	
	# Function handles player run
	var direction = Input.get_axis("move_left","move_right") # get left and right inputs
	#print(direction) # left = -1, right = 1, nothing = 0
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
	# this function handles player jump
	if Input.is_action_just_pressed("jump") and is_on_floor(): # if we jumped on the floor
		velocity.y = JUMPHEIGHT # jump
		current_state = State.jump # jump state
		
	if !is_on_floor() and current_state == State.jump: # if we are jumping
		var direction = Input.get_axis("move_left","move_right") # get left and right inputs
		velocity.x += direction * JUMPSPEED * delta # a little spice

func player_slash(delta):
	# this function handles player slash
	var direction = Input.get_axis("move_left","move_right")
	if direction != 0: # if we are moving
		return # hell no slash
	
	if Input.is_action_just_pressed("slash") and is_on_floor(): # if we on the floor and want to slash
		current_state = State.slash # of course we slash
		slash_timer.start() # start timer because idk another way atm
		

func _on_slash_timer_timeout():
	# this handles slash animation timer ending
	if current_state == State.slash: # if the timer is ending on slash state
		current_state = State.idle # switch it to idle after


	
func player_animations():
	# animations depending on state
	if current_state == State.idle:
		animated_sprite_2d.play("idle")
	elif current_state == State.run and is_on_floor():
		# make sure that x axis movement in air stays as jump state
		animated_sprite_2d.play("player_run")
	elif current_state == State.jump:
		animated_sprite_2d.play("player_jump")
	elif current_state == State.slash:
		animated_sprite_2d.play("player_slash")

