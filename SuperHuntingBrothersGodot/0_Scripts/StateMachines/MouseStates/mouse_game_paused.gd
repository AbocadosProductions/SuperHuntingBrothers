extends State

@export var mouse : CharacterBody2D

func Enter():
	mouse.velocity = Vector2(0, 0)
	mouse.mouse_state_machine_signal.connect(on_mouse_signal_detected)
	mouse.External_Signal.emit(Constants.ANIMATION_BEGGINING_RIGHT)

func Exit():
	mouse.mouse_state_machine_signal.disconnect(on_mouse_signal_detected)

func on_mouse_signal_detected(signal_data):
	if Constants.PAUSE_MENU_SIGNAL == signal_data:
		Transition.emit(self, mouse.last_state)
