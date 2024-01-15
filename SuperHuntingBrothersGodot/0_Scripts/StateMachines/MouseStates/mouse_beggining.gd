extends State

var begining_time : float

@export var mouse : CharacterBody2D


func Enter():
	mouse.velocity = Vector2(0, 0)
	mouse.mouse_state_machine_signal.connect(on_mouse_signal_detected)
	mouse.External_Signal.emit(Constants.ANIMATION_ATTACK)

func Exit():
	begining_time = 0
	mouse.mouse_state_machine_signal.disconnect(on_mouse_signal_detected)

func Update(_delta : float):
	if begining_time < Constants.MAX_BEGINING_TIME:
		begining_time += _delta
	else:
		Transition.emit(self, Constants.MOUSE_FLEE_SIGNAL)

func on_mouse_signal_detected(signal_data):
	if Constants.SCENE_MANAGER_MICE_CAPTURED_SIGNAL == signal_data:
		Transition.emit(self, Constants.SCENE_MANAGER_MICE_CAPTURED_SIGNAL)
