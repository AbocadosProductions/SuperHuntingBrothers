extends Node2D

@export var cat1_state_machine : Node2D
@export var cat2_state_machine : Node2D
@export var points_menu : Control
@export var pause_menu : Control

signal Internal_Signal
signal External_Signal

func _ready():
	for child in cat1_state_machine.get_children():
		if child is State:
			child.Transition.connect(scene_manager_state_controller)
	for child in cat2_state_machine.get_children():
		if child is State:
			child.Transition.connect(scene_manager_state_controller)
	points_menu.External_Signal.connect(scene_manager_state_controller)
	pause_menu.External_Signal.connect(scene_manager_state_controller)

func scene_manager_state_controller(emisioner, signal_detected):
	Internal_Signal.emit(signal_detected)
