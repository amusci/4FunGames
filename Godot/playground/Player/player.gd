class_name Player
extends CharacterBody2D

# Export variables
@export var speed = 180.0
@export var jump_force = -230.0
@export var jump_time : float = 0.21
@export var coyote_time : float = 0.1
@export var jump_buffer_time : float = 0.2
@export var gravity_multiplier : float = 3.0
@export var acceleration : float = 12
@export var gravity_jump_increment : float = 15
@export var gravity_clamp : float = 1300
@export var amount_of_coins_in_level : int = 10
@export var wall_jump_pushoff : float = 290
@export var wall_slide_gravity : float = 45
@export var climbing_speed : float = 50
@export var climbing_jump_x : float = 60
@export var climbing_jump_force : float = -300
@export var falling_speed_clamp : float = 750
@export var respawn_area : Vector2 = Vector2.ZERO

# Variables in-house
var gravity = 700
var is_jumping : bool = false
var jump_timer : float = 0
var coyote_counter : float = 0
var jump_buffer_counter : float = 0
var can_control : bool = true
var facing_right : bool = false
var is_wall_sliding : bool = false
var collected_coins : int = 0
var debug_flying : bool = false
var climbing : bool = false
var is_wall_jumping = false

# On ready variables
@onready var sprite_2d = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer


# Signals

signal increment_death
signal coin_collected

func _physics_process(delta):
	if not can_control: # If we cant control our player, return
		return
	# Function called once per physics frame
	if Input.is_action_just_pressed("move_down") and is_on_floor and !climbing: # Allow dropping under one way platforms
		position.y += 1
	
	player_jump(delta) # Line 33
	player_run(delta) # Line 47
	wall_slide(delta) # Line 106
	player_debug(delta) # Comment out to test level easily
	player_climb(delta) # Might take it out
	#print(is_on_wall_only())
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
		gravity = 580 # Make sure gravity starts at 580
	else: # If we are jumping/falling
		gravity += gravity_jump_increment * delta # Increase gravity to give player weight
		# Clamp gravity after incrementing
		if gravity >= gravity_clamp:
			gravity = gravity_clamp # Clamp gravity to 1300
		velocity.y += gravity * gravity_multiplier * delta # Apply gravity
		velocity.y = min(velocity.y, falling_speed_clamp) # Clamp falling speed
		coyote_counter -= delta # Decrement Counter
	
	if is_jumping and velocity.y < .5: # If we are at the apex
		gravity -= 600 * delta # Remove a bit of gravity to have a floaty apex
	
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
		
	if is_wall_sliding and Input.is_action_just_pressed("jump"): # Handle wall jump
		gravity = 350 # Set gravity to a bit lighter for better feeling walljumps
		if facing_right:
			print('right')
			gravity = 350 # Set gravity to a bit lighter for better feeling walljumps
			velocity.y = jump_force * 1.5 # Jump up
			velocity.x = -wall_jump_pushoff # Jump towards left
		else:
			gravity = 350 # Set gravity to a bit lighter for better feeling walljumps
			velocity.y = jump_force * 1.5 # Jump up
			velocity.x = wall_jump_pushoff # Jump towards left

		
func wall_slide(delta):
	# This will handle all player movement against the wall
	if is_on_wall_only() : # If on wall in air
		is_wall_sliding = true
	else:
		is_wall_sliding = false

	if is_wall_sliding: # If we are on a wall
		if facing_right:
			velocity.x += 2
			velocity.y += (wall_slide_gravity * delta) # Slide down
			velocity.y = min(velocity.y, wall_slide_gravity) # Slide down
		else:
			velocity.x -= 2
			velocity.y += (wall_slide_gravity * delta) # Slide down
			velocity.y = min(velocity.y, wall_slide_gravity) # Slide down
	else:
		pass
		
func spring(power: float, direction: float) -> void:
	# This function handles spring.gd
	velocity.x = velocity.x - cos(direction) * power # Get the horizontal component of force
	velocity.y = -sin(direction) * power # Get the vertical component of force
	
func player_climb(delta):
	if climbing == true:
		if Input.is_action_pressed("jump"):
			climbing == false
			if facing_right == true:
				velocity.y = climbing_jump_force
				velocity.x += climbing_jump_x
			else:
				velocity.y = climbing_jump_force
				velocity.x -= climbing_jump_x
		elif Input.is_action_pressed("player_ascend"):
			velocity.y = -climbing_speed
		elif Input.is_action_pressed("player_descend"):
			velocity.y = climbing_speed
		elif Input.is_anything_pressed() == false:
			velocity.y = 0

func player_debug(delta):
	if Input.is_action_pressed("debug_fly_up"):
		gravity = 0
		debug_flying = true
		velocity.y -= 1000 * delta # Adjust the upward velocity
	elif Input.is_action_pressed("debug_fly_down"):
		debug_flying = false
		gravity = 400
	elif Input.is_action_just_pressed("player_reset"):
		reset_player()

func handle_death() -> void:
	# Function handles player death
	# emit_signal("player_death") # Emit death
	TransitionScreen.transition()
	visible = false
	can_control = false
	await get_tree().create_timer(.5).timeout # Wait for timer to time out
	reset_player()

func reset_player() -> void:
	# Function handles player reset
	emit_signal("increment_death")  # Increase death count
	global_position = respawn_area  # Set the player's respawn position
	visible = true
	can_control = true
 
	
func increment_coin_count() -> void:
	collected_coins += 1
	emit_signal("coin_collected")
	print("Collected coins: ", collected_coins)

	# Adjust the path to find the real_finish_flag node correctly
	var real_finish_flag = get_tree().get_root().find_child("real_finish_flag", true, false)
	if real_finish_flag:
		if collected_coins >= amount_of_coins_in_level:
			# Enable interaction with the real_finish_flag
			real_finish_flag.set_process_input(true)
		else:
			# Disable interaction with the real_finish_flag
			real_finish_flag.set_process_input(false)
	else:
		print("Error: 'real_finish_flag' not found in the scene tree.")


	
func player_animations(direction : float) -> void:
	# Function handles all player animations
	if abs(direction) > 0.1 and is_on_floor(): # If we are moving and on floor
		sprite_2d.play("player_walk") # Running animation
	elif not is_on_floor() && not climbing: # If we are in the air
		sprite_2d.play("player_jump") # Jumping animation
	elif climbing && Input.is_action_pressed("player_ascend"):
		sprite_2d.play("player_climb")
	elif climbing && Input.is_action_pressed("player_descend"):
		sprite_2d.play_backwards("player_climb")
		
	else: 
		sprite_2d.play("player_idle") # Idle animation


