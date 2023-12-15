extends State

@export var cat : CharacterBody2D

var flee_time = 0 

func Enter():
	cat.velocity = Vector2(0, 0)
	cat.cat_state_machine_signal.connect(on_cat_signal_detected)
	cat.External_Signal.emit(Constants.ANIMATION_FLEE)

func Exit():
	cat.cat_state_machine_signal.disconnect(on_cat_signal_detected)
	flee_time = 0 

func Update(_delta : float):
	if flee_time < Constants.MAX_FLEE_TIME:
		flee_time += _delta
	else:
		Transition.emit(self, Constants.CAT_MANUAL_CONTROL_SIGNAL)

func on_cat_signal_detected(signal_data):
	if Constants.PAUSE_MENU_SIGNAL == signal_data:
		Transition.emit(self, Constants.PAUSE_MENU_SIGNAL)
