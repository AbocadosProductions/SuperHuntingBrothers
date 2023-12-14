extends CharacterBody2D


var mouse_is_fleing : bool = false

signal mouse_state_machine_signal

@export var scene_manager : Node2D

func _ready():
	scene_manager.External_Signal.connect(scene_manager_signal_detected)

func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	detect_collision(collision_info)

func detect_collision(collision_info):
	if collision_info:
		var collision_name = collision_info.get_collider().get_name()
		if Constants.WALL_PREFIX in collision_name:
			mouse_state_machine_signal.emit(Constants.WALL_PREFIX)

func _on_area_2d_body_entered(body):
	if Constants.CAT_PREFIX in body.name and not mouse_is_fleing:
		body.mouse_captured()
		mouse_state_machine_signal.emit(Constants.MOUSE_CAT_DETECTED_SIGNAL)

func scene_manager_signal_detected(signal_emited):
	if signal_emited in [Constants.SCENE_MANAGER_MICE_CAPTURED_SIGNAL, Constants.TIME_MANAGER_NEW_MAZES_TIMEOUT_SIGNAL]:
		mouse_state_machine_signal.emit(Constants.SCENE_MANAGER_MICE_CAPTURED_SIGNAL)
	if signal_emited == Constants.SCENE_MANAGER_NEW_MAZES_START_SIGNAL:
		mouse_state_machine_signal.emit(Constants.MOUSE_IDLE_SIGNAL)
	if signal_emited == Constants.PAUSE_MENU_SIGNAL:
		mouse_state_machine_signal.emit(Constants.PAUSE_MENU_SIGNAL)
