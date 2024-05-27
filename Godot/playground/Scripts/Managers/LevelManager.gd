extends Node

var levels : Array[LevelData] # Hold level data

# Reference to main scene
var main_scene : Node2D = null
# Reference to current level
var loaded_level : Level = null

func unload_level() -> void:
	# Function to unload the current level
	if is_instance_valid(loaded_level): # If theres a level loaded
		loaded_level.queue_free() # Free them
		
	loaded_level = null # Set loaded level to NULL

func load_level(level_id : int) -> void:
	# Function to load a level
	print("Loading Level: %s" % level_id) # Log the level loading process
	unload_level() #Unload current level
	
	var level_data = get_level_data_by_id(level_id) # Get level data by ID (line 40)
	
	if not level_data: # If nothing, just return
		return
	
	var level_path = "res://levels/%s.tscn" % level_data.level_path # All you need to do is type in the level name without .tscn 
																	# I.E level_one
	
	var level_res := load(level_path) # Load the scene resource from the path
	
	if level_res: # If the scene is loaded
		loaded_level = level_res.instantiate() # Instantiate the scene
		
		main_scene.add_child(loaded_level) # Add the instantiated level to the main scene
	else: # If that doesn't happen, the level doesnt exist.
		print("Level does not exist.")
		print(level_path)

func get_level_data_by_id(id : int) -> LevelData:
	# Function to get level data by its ID
	var level_to_return : LevelData = null # Variable to hold level data
	
	for lvl : LevelData in levels: # Iterate through all levels
		if lvl.level_id == id: # Check if the id matches the requested id
			level_to_return = lvl # Assign the level to the return 
	
	return level_to_return





