extends State


@export var scene_manager : Node2D


func Enter():
	scene_manager.External_Signal.emit("mice_captured")
	
