extends State

@export var cat : CharacterBody2D


func Enter():
	cat.velocity = Vector2(0, 0)
	cat.cat_state_machine_signal.connect(on_cat_signal_detected)
	cat.External_Signal.emit(Constants.ANIMATION_ATTACK)

func Exit():
	cat.cat_state_machine_signal.disconnect(on_cat_signal_detected)

func on_cat_signal_detected(signal_data):
	if Constants.CAT_MANUAL_CONTROL_SIGNAL == signal_data:
		Transition.emit(self, Constants.CAT_MANUAL_CONTROL_SIGNAL)
	if Constants.SCENE_MANAGER_NEW_MAZES_PREPARATION_SIGNAL == signal_data:
		cat.External_Signal.emit(Constants.ANIMATION_IDLE)
