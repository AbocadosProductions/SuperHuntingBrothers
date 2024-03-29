extends CharacterBody2D


var mouse_is_fleing : bool = false
var last_state = ""
var direction = "_Right"
var difficulty

signal mouse_state_machine_signal
signal External_Signal

@export var scene_manager : Node2D
@export var level_manager : Node2D
@export var data_manager : Node2D
@export var music_manager : Node2D

func _ready():
	scene_manager.External_Signal.connect(scene_manager_signal_detected)
	difficulty = data_manager.get_difficulty()
	

func _physics_process(_delta):
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
	if signal_emited == Constants.SCENE_MANAGER_NEW_MAZES_PREPARATION_SIGNAL:
		mouse_state_machine_signal.emit(Constants.MOUSE_BEGINING_SIGNAL)

func set_target_in_maze_coordinates(old_coordinates : Vector2):
	var coordinates = level_manager.set_target_in_maze_coordinates(self, old_coordinates)
	return coordinates

func play(audio_to_play : String):
	music_manager.play(audio_to_play)
