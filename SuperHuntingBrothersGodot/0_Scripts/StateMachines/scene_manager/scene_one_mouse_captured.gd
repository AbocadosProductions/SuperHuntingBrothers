extends State

@export var scene_manager : Node2D

func Enter():
	scene_manager.Internal_Signal.connect(signal_detected)


func Exit():
	scene_manager.Internal_Signal.disconnect(signal_detected)

func signal_detected(signal_data):
	if signal_data == Constants.CAT_MANUAL_CONTROL_SIGNAL:
		Transition.emit(self, Constants.SCENE_MANAGER_LEVEL_RUNNING_SIGNAL)

	elif signal_data == Constants.CAT_MOUSE_CAPTURED_SIGNAL:
		Transition.emit(self, Constants.SCENE_MANAGER_MICE_CAPTURED_SIGNAL)

	elif signal_data == Constants.TIME_MANAGER_NEW_MAZES_TIMEOUT_SIGNAL:
		Transition.emit(self, Constants.TIME_MANAGER_NEW_MAZES_TIMEOUT_SIGNAL)

	elif signal_data == Constants.PAUSE_MENU_SIGNAL:
		Transition.emit(self, Constants.PAUSE_MENU_SIGNAL)
