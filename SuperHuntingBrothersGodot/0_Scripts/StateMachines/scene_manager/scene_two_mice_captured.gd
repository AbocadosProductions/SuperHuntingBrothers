extends State

@export var scene_manager : Node2D

var preparation_time : float = 0.5
var time_passed_in_state : float = 0

func Enter():
	scene_manager.External_Signal.emit(Constants.SCENE_MANAGER_MICE_CAPTURED_SIGNAL)

func Exit():
	time_passed_in_state = 0

func Update(_delta):
	time_passed_in_state += _delta
	if time_passed_in_state > preparation_time:
		Transition.emit(self, Constants.SCENE_MANAGER_SHOW_POINTS_SIGNAL)
