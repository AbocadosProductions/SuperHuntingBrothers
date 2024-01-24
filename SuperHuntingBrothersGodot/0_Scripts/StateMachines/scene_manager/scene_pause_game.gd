extends State

@export var scene_manager : Node2D

func Enter():
	scene_manager.External_Signal.emit(Constants.PAUSE_MENU_SIGNAL)
	scene_manager.play(Constants.PAUSE_EFFECT)
	scene_manager.Internal_Signal.connect(signal_detected)

func Exit():
	scene_manager.Internal_Signal.disconnect(signal_detected)
	scene_manager.External_Signal.emit(Constants.PAUSE_MENU_SIGNAL)

func signal_detected(signal_data):
	if signal_data == Constants.PAUSE_MENU_SIGNAL:
		Transition.emit(self, Constants.SCENE_MANAGER_LEVEL_RUNNING_SIGNAL)
		scene_manager.play(Constants.PLAY_EFFECT)
