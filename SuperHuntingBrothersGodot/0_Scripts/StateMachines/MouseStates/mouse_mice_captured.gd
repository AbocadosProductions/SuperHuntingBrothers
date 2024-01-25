extends State

const MAX_CAPTURE_TIME : float = 2.0

var capture_time : float

@export var mouse : CharacterBody2D


func Enter():
	mouse.play(Constants.CATCH_EFFECT)
	mouse.velocity = Vector2(0, 0)
	mouse.mouse_state_machine_signal.connect(on_mouse_signal_detected)
	mouse.External_Signal.emit(Constants.ANIMATION_ATTACK)

func Exit():
	mouse.mouse_state_machine_signal.disconnect(on_mouse_signal_detected)

func on_mouse_signal_detected(signal_data):
	if Constants.MOUSE_BEGINING_SIGNAL == signal_data:
		Transition.emit(self, Constants.MOUSE_BEGINING_SIGNAL)
