extends State


var capture_time : float

@export var cat : CharacterBody2D


func Enter():
	cat.velocity = Vector2(0, 0)
	cat.cat_state_machine_signal.connect(on_cat_signal_detected)
	cat.External_Signal.emit(Constants.ANIMATION_ATTACK)

func Exit():
	cat.cat_state_machine_signal.disconnect(on_cat_signal_detected)
	capture_time = 0

func Update(_delta : float):
	if capture_time < Constants.MAX_CAPTURE_TIME:
		capture_time += _delta
	else:
		Transition.emit(self, Constants.MOUSE_FLEE_SIGNAL)

func on_cat_signal_detected(signal_data):
	if Constants.SCENE_MANAGER_MICE_CAPTURED_SIGNAL == signal_data:
		Transition.emit(self, Constants.SCENE_MANAGER_MICE_CAPTURED_SIGNAL)
