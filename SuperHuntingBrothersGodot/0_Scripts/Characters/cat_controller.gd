extends CharacterBody2D

signal Collision

@export var scene_manager : Node2D

func _ready():
	scene_manager.External_Signal.connect(scene_manager_signal_detected)

func _physics_process(delta):
	move_and_slide()

func mouse_captured():
	Collision.emit("mouse")

func scene_manager_signal_detected(signal_emited):
	if signal_emited == "mice_captured":
		Collision.emit(signal_emited)
