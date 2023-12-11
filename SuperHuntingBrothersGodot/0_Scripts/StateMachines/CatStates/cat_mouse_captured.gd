extends State

const MAX_CAPTURE_TIME :float = 2.0

var capture_time : float

@export var cat : CharacterBody2D


func Enter():
	cat.velocity = Vector2(0, 0)
	cat.cat_state_machine_signal.connect(on_cat_signal_detected)

func Exit():
	cat.cat_state_machine_signal.disconnect(on_cat_signal_detected)
	capture_time = 0

func Update(_delta : float):
	if capture_time < MAX_CAPTURE_TIME:
		capture_time += _delta
	else:
		Transition.emit(self, Constants.CAT_MANUAL_CONTROL_SIGNAL)

func on_cat_signal_detected(signal_data):
	if Constants.SCENE_MANAGER_MICE_CAPTURED_SIGNAL == signal_data:
		Transition.emit(self, Constants.SCENE_MANAGER_MICE_CAPTURED_SIGNAL)
