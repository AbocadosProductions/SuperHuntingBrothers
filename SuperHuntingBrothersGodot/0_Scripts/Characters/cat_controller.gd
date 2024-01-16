extends CharacterBody2D

signal cat_state_machine_signal
signal External_Signal

@export var scene_manager : Node2D

var direction = ""
var last_state = ""

func _ready():
	scene_manager.External_Signal.connect(scene_manager_signal_detected)

func _physics_process(_delta):
	move_and_slide()

func mouse_captured():
	cat_state_machine_signal.emit(Constants.CAT_MOUSE_CAPTURED_SIGNAL)

func scene_manager_signal_detected(signal_emited):
	if signal_emited in [Constants.SCENE_MANAGER_MICE_CAPTURED_SIGNAL, Constants.TIME_MANAGER_NEW_MAZES_TIMEOUT_SIGNAL]:
		cat_state_machine_signal.emit(Constants.SCENE_MANAGER_MICE_CAPTURED_SIGNAL)
	elif signal_emited == Constants.SCENE_MANAGER_NEW_MAZES_START_SIGNAL:
		cat_state_machine_signal.emit(Constants.CAT_MANUAL_CONTROL_SIGNAL)
	if signal_emited == Constants.PAUSE_MENU_SIGNAL:
		cat_state_machine_signal.emit(Constants.PAUSE_MENU_SIGNAL)
