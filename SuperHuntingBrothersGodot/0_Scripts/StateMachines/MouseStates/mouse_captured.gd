extends State

const MAX_CAPTURE_TIME : float = 2.0

var capture_time : float

@export var mouse : CharacterBody2D



func Enter():
	mouse.velocity = Vector2(0, 0)
	mouse.mouse_state_machine_signal.connect(on_mouse_signal_detected)

func Exit():
	capture_time = 0
	mouse.mouse_state_machine_signal.disconnect(on_mouse_signal_detected)

func Update(_delta : float):
	if capture_time < MAX_CAPTURE_TIME:
		capture_time += _delta
	else:
		Transition.emit(self, "flee")

func on_mouse_signal_detected(signal_data):
	if "mice_captured" == signal_data:
		Transition.emit(self, "mice_captured")

			
