class_name Player
extends CharacterBody2D

# Export variables
@export var speed = 250.0
@export var jump_force = -250.0
@export var jump_time : float = 0.2
@export var coyote_time : float = 0.1
@export var jump_buffer_time : float = 0.2
@export var gravity_multiplier : float = 3.0
@export var acceleration : float = 15
@export var gravity_jump_increment : float = 15
@export var gravity_clamp : float = 1300

# Variables in-house
var gravity = 980
var is_jumping : bool = false
var jump_timer : float = 0
var coyote_counter : float = 0
var jump_buffer_counter : float = 0
var can_control : bool = true
var facing_right : bool = false

# On ready variables
@onready var sprite_2d = $Sprite2D
@onready var animation_player = $AnimationPlayer

# Signals
signal player_death

func _physics_process(delta):
	if not can_control: # If we cant control our player, return
		return
	# Function called once per physics frame
	player_jump(delta) # Line 33
	player_run(delta) # Line 47
	move_and_slide() # 

func player_run(delta):
	var direction = Input.get_axis("move_left", "move_right") # Get left and right inputs

	if direction != 0: # If inputs exist
		if direction > 0: # If going right
			velocity.x = min(velocity.x + acceleration, speed) # Whatever minimum from start acceleration to max speed
			sprite_2d.flip_h = false # Make sure the sprite is not flipped
			facing_right = true
		else: # If going left
			velocity.x = max(velocity.x - acceleration, -speed) # Whatever maximum (remember going left is negative)
			sprite_2d.flip_h = true # Flip the sprite horizontally
			facing_right = false
	else: # If no inputs
		velocity.x = move_toward(velocity.x, 0, acceleration + 3) # MOVE TO A HALT
	player_animations(direction) # Call animations

func player_jump(delta):
	# Print debug information
	'''print("is_on_floor: ", is_on_floor())
	print("is_jumping: ", is_jumping)
	print("coyote_counter: ", coyote_counter)
	print("jump_timer: ", jump_timer)'''
	
	# This function handles player's ability to jump
	if is_on_floor(): # If we are on the floor
		coyote_counter = coyote_time
		gravity = 800 # Make sure gravity starts at 980
	else: # If we are jumping/falling
		gravity += gravity_jump_increment * delta # Increase gravity to give player weight
		# Clamp gravity after incrementing
		if gravity >= gravity_clamp:
			gravity = gravity_clamp # Clamp gravity to 1300
		velocity.y += gravity * gravity_multiplier * delta # Apply gravity
		coyote_counter -= delta # Decrement Counter
	
	if is_jumping and velocity.y < .5: # If we are at the apex
		gravity -= 25 * delta # Remove a bit of gravity to have a floaty apex
	
	if Input.is_action_just_pressed("jump"): # This will allow us to jump just before landing
		jump_buffer_counter = jump_buffer_time # We set the counter to the time we want our character to jump before landing
	else:
		jump_buffer_counter -= delta # Decrement counter by delta since we aren't jumping we want it to go down to 0
	
	if coyote_counter >= 0 and jump_buffer_counter > 0: # If we aren't jumping (since 0) and jumping (line 64) 
		jump_buffer_counter = 0 # Instantly set counter to 0
		velocity.y = jump_force # Apply jump force
		is_jumping = true # Switch the jump flag to true
	elif Input.is_action_pressed("jump") and is_jumping: # If we are holding jump while jumping
		velocity.y = jump_force # Maintain jump force for a higher jump
	
	if is_jumping and Input.is_action_pressed("jump") and jump_timer < jump_time: # Handle jump height based on button hold duration
		jump_timer += delta # Increment jump timer
	else: # If anything else is happening
		is_jumping = false # Switch flag back to not jumping
		jump_timer = 0 # Reset timer since we aren't jumping

func handle_death() -> void:
	# Function handles player death
	emit_signal("player_death")
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout # Wait for timer to time out
	reset_player()
	
func reset_player() -> void:
	# Function handles player reset
	global_position = Vector2(0,0) # Set the global position to (0, 0)
	visible = true
	can_control = true
	
func player_animations(direction : float) -> void:
	# Function handles all player animations
	if abs(direction) > 0.1 and is_on_floor(): # If we are moving and on floor
		animation_player.play("running") # Running animation
	elif not is_on_floor(): # If we are in the air
		animation_player.play("jump") # Jumping animation
	else: 
		animation_player.play("idle") # Idle animation
