extends Node

var maze_scenes = []
var node_names_in_use = []
var level : Node2D
var path = "res://Scenes/Mazes"
var maze_1_pos = Vector2(100, 0)
var maze_2_pos = Vector2(400, 0)
var maze_path_1
var maze_path_2
var new_maze_1_name
var new_maze_2_name
var possible_mazes = []

func get_maze_scenes():
	var dir = DirAccess.open(path)

	if not dir:
		return
	
	for file in dir.get_files():
		if file.ends_with(".tscn"):
			maze_scenes.append(file.split(".")[0])

func get_mazes_in_use():
	for child in level.get_children():
		if "maze" in child.name:
			node_names_in_use.append(child.name)


func get_new_mazes():
	for maze in maze_scenes:
		if maze not in node_names_in_use:
			possible_mazes.append(maze)
	
	new_maze_1_name = possible_mazes[randi() % possible_mazes.size()]
	possible_mazes.erase(new_maze_1_name)
	new_maze_2_name = possible_mazes[randi() % possible_mazes.size()]

	maze_path_1 = path + "/%s.tscn"
	maze_path_1 = maze_path_1 % new_maze_1_name
	maze_path_2 = path + "/%s.tscn"
	maze_path_2 = maze_path_2 % new_maze_2_name
	
func restart_lists():
	possible_mazes = []
	node_names_in_use = []
	maze_scenes = []
	
func load_new_mazes():
	var maze_1_node = load(maze_path_1)	
	var maze_1_node_instance =  maze_1_node.instantiate() 
	maze_1_node_instance.position = maze_1_pos
	maze_1_node_instance.name = new_maze_1_name
	level.call_deferred("add_child", maze_1_node_instance)
	
	var maze_2_node = load(maze_path_2)	
	var maze_2_node_instance =  maze_2_node.instantiate()
	maze_1_node_instance.position = maze_2_pos
	maze_2_node_instance.name = new_maze_2_name
	level.call_deferred("add_child", maze_2_node_instance)
		

func delete_previous_mazes():
	for child in level.get_children():
		if "maze" in child.name:
			child.queue_free()


func _ready():
	level = get_parent()


func _on_button_pressed():
	get_maze_scenes()
	get_mazes_in_use()
	get_new_mazes()
	restart_lists()
	delete_previous_mazes()
	load_new_mazes()
