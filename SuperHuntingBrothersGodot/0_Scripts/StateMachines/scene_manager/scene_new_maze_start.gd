extends State


@export var scene_manager : Node2D

var preparation_time : float = Constants.SCENE_MANAGER_PREPARATION_TIME
var time_passed_in_state : float = 0

func Enter():
	scene_manager.External_Signal.emit(Constants.SCENE_MANAGER_NEW_MAZES_PREPARATION_SIGNAL)

func Exit():
	time_passed_in_state = 0

func Update(_delta):
	time_passed_in_state += _delta
	if time_passed_in_state > preparation_time:
		scene_manager.External_Signal.emit(Constants.SCENE_MANAGER_NEW_MAZES_START_SIGNAL)
		Transition.emit(self, Constants.SCENE_MANAGER_LEVEL_RUNNING_SIGNAL)
	
