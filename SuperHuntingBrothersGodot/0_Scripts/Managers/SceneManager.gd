extends Node2D

@export var cat1_state_machine : Node2D
@export var cat2_state_machine : Node2D

signal Mouse_State

signal External_Signal

func _ready():
	for child in cat1_state_machine.get_children():
		if child is State:
			child.Transition.connect(scene_manager_state_controller)
	for child in cat2_state_machine.get_children():
		if child is State:
			child.Transition.connect(scene_manager_state_controller)


func scene_manager_state_controller(cat_state, cat_new_state_name):
	Mouse_State.emit(cat_new_state_name)
