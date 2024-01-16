extends State

@export var scene_manager : Node2D

var preparation_time : float = Constants.SCENE_MANAGER_TIME_OUT_TIME
var time_passed_in_state : float = 0

func Enter():
	scene_manager.External_Signal.emit(Constants.TIME_MANAGER_NEW_MAZES_TIMEOUT_SIGNAL)

func Exit():
	time_passed_in_state = 0

func Update(_delta):
	time_passed_in_state += _delta
	if time_passed_in_state > preparation_time:
		scene_manager.External_Signal.emit(Constants.SCENE_MANAGER_NEW_MAZES_START_SIGNAL)
		get_tree().change_scene_to_file(Constants.LOSE_MENU)
	
