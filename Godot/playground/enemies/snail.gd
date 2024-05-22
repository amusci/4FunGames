extends CharacterBody2D
@export var patrol_points : Node
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var timer = $Timer


const GRAVITY = 1000
const SPEED = 1500

enum State {hide,walk} # states of enemy
var current_state : State 
var direction : Vector2 = Vector2.LEFT # set direction to start at left
var number_of_points : int # variable to store amount of points
var point_positions : Array[Vector2] # array to show position of points
var current_point : Vector2 # variable to store the current point
var current_point_position : int # current point position
var can_walk : bool = false # snail hide toggle

func _ready():
	if patrol_points != null: # if patrol points exist
		number_of_points = patrol_points.get_children().size() # get the amount of points
		print(number_of_points)
		for point in patrol_points.get_children(): # loop through the points
			point_positions.append(point.global_position) # append points to array
		current_point = point_positions[current_point_position] # current point
	else:
		print("No Patrol Points")
		
	current_state = State.hide # start scared
	
func _physics_process(delta):
	snail_gravity(delta)
	snail_hide(delta)
	snail_walk(delta)
	move_and_slide()
	enemy_animations()
	
	# Debug Statements
	'''print("Current point positions: ", point_positions)
	print("Current point position index: ", current_point_position)
	print("Current point: ", current_point)'''
	
func snail_gravity(delta):
	# Function handles snail gravity
	velocity.y += GRAVITY * delta

func snail_hide(delta : float):
	# Function handles when snail hides
	if !can_walk:
		velocity.x = move_toward(velocity.x,0,SPEED * delta)
		current_state = State.hide
	
func snail_walk(delta : float):
	# Function handles when snail patrols
	if !can_walk: # if no walk return
		return
		
	if abs(position.x -current_point.x) > 0.5: # if the difference between sprite and patrol point > 0.5
		velocity.x = direction.x * SPEED * delta # move it move it
		current_state = State.walk
	else:
		current_point_position += 1 # else, we go to next patrol point
		
		if current_point_position >= number_of_points: # if we ran out of patrol points
			current_point_position = 0 # back to first one
		
		current_point = point_positions[current_point_position] # set current point to where we needa go
		if current_point.x > position.x: # if the patrol point to the right of us
			direction = Vector2.RIGHT # go right
		
		else: # if patrol point to the left of us
			direction = Vector2.LEFT # go left
		if direction.x > 0: # if we go right, sprite right
			print(direction.x)
			animated_sprite_2d.flip_h = true
		else: # if we go left, sprite left
			print(direction.x)
			animated_sprite_2d.flip_h = false
		
		can_walk = false # at the end, make sure we cant walk
		timer.start() # start timer (timer idles 3s, then allows us to walk) 

func enemy_animations():
	# snail states
	if current_state == State.hide && !can_walk: # if snail hide and cant walk func _on_timer_timeout():
		if animated_sprite_2d.animation != "snail_hide": # make sure the animation only plays once
			animated_sprite_2d.play("snail_hide") # hiiiiiiide
	elif current_state == State.walk && can_walk: # if state is walk and we can walk
		animated_sprite_2d.play("snail_walk") # waaaalk
		

func _on_timer_timeout():
	# when timer ends, move it move it
	can_walk = true
