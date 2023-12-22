extends Node

var maze_scenes = []
var node_names_in_use = []
var level : Node2D
var path = Constants.MAZES_FOLDER_PATH
var maze_1_pos = Constants.MAZES_1_POSITION
var maze_2_pos = Constants.MAZES_2_POSITION
var maze_path_1
var maze_path_2
var new_maze_1_name
var new_maze_2_name
var possible_mazes = []

@export var scene_manager : Node2D
@export var cat_1 : Node2D
@export var cat_2 : Node2D
@export var mouse_1 : Node2D
@export var mouse_2 : Node2D

func get_maze_scenes():
	var dir = DirAccess.open(path)

	if not dir:
		return
	
	for file in dir.get_files():
		if file.ends_with(Constants.MAZE_FILE_TERMINATION):
			maze_scenes.append(file.split(".")[0])

func get_mazes_in_use():
	for child in level.get_children():
		if Constants.MAZE_FILE_PREFIX in child.name:
			node_names_in_use.append(child.name)
	if node_names_in_use == []:
		node_names_in_use = ["", ""]

func get_new_mazes():
	for maze in maze_scenes:
		if maze not in node_names_in_use:
			possible_mazes.append(maze)
	
	new_maze_1_name = possible_mazes[randi() % possible_mazes.size()]
	possible_mazes.erase(new_maze_1_name)
	new_maze_2_name = possible_mazes[randi() % possible_mazes.size()]

	maze_path_1 = path + Constants.MAZE_PATH_FORMAT_STRING
	maze_path_1 = maze_path_1 % new_maze_1_name
	maze_path_2 = path + Constants.MAZE_PATH_FORMAT_STRING
	maze_path_2 = maze_path_2 % new_maze_2_name
	
func restart_lists():
	possible_mazes = []
	node_names_in_use = []
	
func load_new_mazes():
	var maze_1_node = load(maze_path_1)	
	var maze_1_node_instance =  maze_1_node.instantiate() 
	maze_1_node_instance.position = maze_1_pos
	maze_1_node_instance.name = new_maze_1_name
	level.call_deferred("add_child", maze_1_node_instance)
	
	var maze_2_node = load(maze_path_2)	
	var maze_2_node_instance =  maze_2_node.instantiate()
	maze_2_node_instance.position = maze_2_pos
	maze_2_node_instance.name = new_maze_2_name
	level.call_deferred("add_child", maze_2_node_instance)


func delete_previous_mazes():
	for child in level.get_children():
		if Constants.MAZE_FILE_PREFIX in child.name:
			child.queue_free()


func _ready():
	scene_manager.External_Signal.connect(scene_manager_signal_detected)
	level = get_parent()
	get_maze_scenes()
	generate_level()

func _on_button_pressed():
	generate_level()

func move_characters_to_positions():
	# Load Positions accordint to the maze
	var positions_maze_1 = Constants.POSITIONS_PER_LEVEL[new_maze_1_name]
	var positions_maze_2 = Constants.POSITIONS_PER_LEVEL[new_maze_2_name]
	# Move characters in maze 1
	cat_1.position = positions_maze_1["cat"][randi() % positions_maze_1["cat"].size()]
	cat_1.position += maze_1_pos
	mouse_1.position = positions_maze_1["mouse"][randi() % positions_maze_1["mouse"].size()]
	mouse_1.position += maze_1_pos
	# Move characters in maze 2
	cat_2.position = positions_maze_2["cat"][randi() % positions_maze_2["cat"].size()]
	cat_2.position += maze_2_pos
	mouse_2.position = positions_maze_2["mouse"][randi() % positions_maze_2["mouse"].size()]
	mouse_2.position += maze_2_pos

func generate_level():
	get_mazes_in_use()
	get_new_mazes()
	restart_lists()
	delete_previous_mazes()
	load_new_mazes()
	move_characters_to_positions()

func scene_manager_signal_detected(signal_emited):
	if signal_emited == Constants.SCENE_MANAGER_NEW_MAZES_PREPARATION_SIGNAL:
		generate_level()
