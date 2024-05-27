class_name Player

extends CharacterBody2D

# Export variables
@export var speed = 300.0
@export var jump_force = -250.0
@export var jump_time : float = 0.25
@export var coyote_time : float = 0.075
@export var gravity_multiplier : float = 3.0

# Variables in-house
var gravity = 980
var is_jumping : bool = false
var jump_timer : float = 0
var coyote_timer : float = 0
var can_control : bool = true


# On ready variables
@onready var sprite_2d = $Sprite2D
@onready var animation_player = $AnimationPlayer

func _physics_process(delta):
	if not can_control: # If we cant control our player, return
		return
	# Function called once per physics frame
	player_jump(delta)
	player_run(delta)
	move_and_slide()


func player_run(delta):
	var direction = Input.get_axis("move_left", "move_right") # Get left and right inputs
	if direction: # If inputs exist
		velocity.x = direction * speed # Add speed to that direction
	else:
		velocity.x = move_toward(velocity.x, 0, speed) # If no inputs, move towards 0 x velocity
	
	if direction != 0:
		if direction > 0: # If going right
			sprite_2d.flip_h = true
		else: # If going left
			sprite_2d.flip_h = false
	player_animations(direction) # call animations

func player_jump(delta):
	if not is_on_floor() and not is_jumping: # Apply gravity if not on the floor and not currently jumping
		velocity.y += gravity * gravity_multiplier * delta # Apply gravity with multiplier
		coyote_timer += delta # Increment coyote timer
	else:
		coyote_timer = 0 # Reset coyote timer if on the floor or jumping
	if Input.is_action_just_pressed("jump") and (is_on_floor() or coyote_timer < coyote_time): # Check for jump
		velocity.y = jump_force # Apply jump force
		is_jumping = true # Set jumping flag to true
	elif Input.is_action_pressed("jump") and is_jumping:
		velocity.y = jump_force # Maintain jump force if jump button is held
	if is_jumping and Input.is_action_pressed("jump") and jump_timer < jump_time: # Handle variable jump height based on button hold duration
		jump_timer += delta # Increment jump timer
	else:
		is_jumping = false # End jumping if conditions are not met
		jump_timer = 0 # Reset jump timer
		

func handle_death() -> void:
	# Function handles player death
	print("Player Died!")
	visible = false
	can_control = false
	
	await get_tree().create_timer(1).timeout # Wait for timer to time out
	
	reset_player()
	
func reset_player() -> void:
	# Function handles player reset
	global_position = Vector2(0, 0)  # Set the global position to (0, 0)
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
	
