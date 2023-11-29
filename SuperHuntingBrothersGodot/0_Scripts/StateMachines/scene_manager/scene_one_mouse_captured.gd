extends State


@export var scene_manager : Node2D

func Enter():
	scene_manager.Mouse_State.connect(signal_detected)

func Exit():
	scene_manager.Mouse_State.disconnect(signal_detected)

func signal_detected(signal_data):
	if signal_data == "manual_control":
		Transition.emit(self, "cats_running")
	elif signal_data == "mouse_captured":
		Transition.emit(self, "two_mice_captured")

