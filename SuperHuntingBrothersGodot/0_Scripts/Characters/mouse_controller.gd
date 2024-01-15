extends CharacterBody2D


var mouse_is_fleing : bool = false
var direction = "_Right"

signal mouse_state_machine_signal
signal External_Signal

@export var scene_manager : Node2D
@export var level_manager : Node2D

func _ready():
	scene_manager.External_Signal.connect(scene_manager_signal_detected)

func _physics_process(delta):
	move_and_slide()

func _on_area_2d_body_entered(body):
	if Constants.CAT_PREFIX in body.name and not mouse_is_fleing:
		body.mouse_captured()
		mouse_state_machine_signal.emit(Constants.MOUSE_CAT_DETECTED_SIGNAL)

func scene_manager_signal_detected(signal_emited):
	if signal_emited in [Constants.SCENE_MANAGER_MICE_CAPTURED_SIGNAL, Constants.TIME_MANAGER_NEW_MAZES_TIMEOUT_SIGNAL]:
		mouse_state_machine_signal.emit(Constants.SCENE_MANAGER_MICE_CAPTURED_SIGNAL)
	if signal_emited == Constants.PAUSE_MENU_SIGNAL:
		mouse_state_machine_signal.emit(Constants.PAUSE_MENU_SIGNAL)

func set_target_in_maze_coordinates(old_coordinates : Vector2):
	var coordinates = level_manager.set_target_in_maze_coordinates(self, old_coordinates)
	return coordinates
