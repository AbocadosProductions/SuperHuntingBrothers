extends State

@export var cat : CharacterBody2D

func Enter():
	cat.velocity = Vector2(0, 0)
	cat.cat_state_machine_signal.connect(on_cat_signal_detected)
	cat.External_Signal.emit(Constants.ANIMATION_IDLE)

func Exit():
	cat.cat_state_machine_signal.disconnect(on_cat_signal_detected)

func on_cat_signal_detected(signal_data):
	if Constants.PAUSE_MENU_SIGNAL == signal_data:
		Transition.emit(self, cat.last_state)
