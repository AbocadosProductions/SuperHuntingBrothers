extends Node2D

@export var data_manager : Node2D
@export var scene_manager : Node2D

@export var current_score_label : Label
@export var record_score_label : Label
@export var current_level_label : Label
@export var record_level_label : Label

var current_score
var record_score
var current_level
var record_level

func _ready():
	scene_manager.External_Signal.connect(scene_manager_signal_detected)
	update_values()
	show_values()

func update_values():
	current_score = data_manager.return_points()
	current_level = data_manager.return_level_index()
	record_level = data_manager.return_record_level_index()
	record_score = data_manager.return_record_points()

func show_values():
	current_score_label.text = str(current_score)
	record_score_label.text = str(record_score)
	current_level_label.text = str(current_level + 1)
	record_level_label.text = str(record_level)


func scene_manager_signal_detected(signal_emited):
	if signal_emited == Constants.SCENE_MANAGER_NEW_MAZES_PREPARATION_SIGNAL:
		update_values()
		show_values()
