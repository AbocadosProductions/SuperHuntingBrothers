extends Control

@export var actual_punctuation_label : Label
@export var record_punctuation_label : Label
@export var actual_level_label : Label
@export var record_level_label : Label

@export var new_record_punctuation_announcer : Node2D
@export var new_record_level_announcer : Node2D

@export var data_manager : Node2D

var updated_points
var record_points
var level_index
var record_index

signal External_Signal

func _ready():
	# Load data from data manager
	updated_points = data_manager.return_points()
	record_points = data_manager.return_record_points()
	level_index = data_manager.return_level_index()
	record_index = data_manager.return_record_level_index()
	
	if updated_points > record_points:
		External_Signal.emit(self, Constants.END_MENU_POINTS_RECORD_SIGNAL)
		data_manager.set_new_record_points()
	if level_index > record_index:
		External_Signal.emit(self, Constants.END_MENU_LEVEL_RECORD_SIGNAL)
		data_manager.set_new_record_level_index()
	
	
	actual_punctuation_label.text = str(updated_points)
	record_punctuation_label.text = str(record_points)
	actual_level_label.text = str(level_index)
	record_level_label.text = str(record_index)

func _on_button_pressed():
	data_manager.reset_data_from_run()
	get_tree().change_scene_to_file(Constants.MAIN_MENU)

func _on_retry_button_pressed():
	data_manager.reset_data_from_run()
	get_tree().change_scene_to_file(Constants.FIRST_LEVEL)
