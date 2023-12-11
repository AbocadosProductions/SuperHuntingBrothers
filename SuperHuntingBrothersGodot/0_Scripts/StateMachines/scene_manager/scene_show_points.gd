extends State

@export var scene_manager : Node2D

func Enter():
	scene_manager.External_Signal.emit(Constants.SCENE_MANAGER_SHOW_POINTS_SIGNAL)
	scene_manager.Internal_Signal.connect(signal_detected)

func Exit():
	scene_manager.Internal_Signal.disconnect(signal_detected)

func signal_detected(signal_data):
	if signal_data == Constants.POINTS_MENU_FINISHED_SIGNAL:
		Transition.emit(self, Constants.SCENE_MANAGER_NEW_MAZES_START_SIGNAL)
