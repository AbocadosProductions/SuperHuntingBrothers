extends CharacterBody2D

signal cat_state_machine_signal

@export var scene_manager : Node2D

func _ready():
	scene_manager.External_Signal.connect(scene_manager_signal_detected)

func _physics_process(delta):
	move_and_slide()

func mouse_captured():
	cat_state_machine_signal.emit("mouse")

func scene_manager_signal_detected(signal_emited):
	if signal_emited == "mice_captured":
		cat_state_machine_signal.emit(signal_emited)
