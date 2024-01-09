extends Node2D

@export var time_label : Label
@export var scene_manager : Node2D
@export var data_manager : Node2D

var time_in_level
var const_level_time
var minimum_time
var time_treshold
var level_index
var const_time_multiplier
var cats_are_running = false
var treshold_reached

signal Time_Signal

func _ready():
	scene_manager.External_Signal.connect(scene_manager_signal_detected)
	time_label.visible = false
	prepare_time_level()

func scene_manager_signal_detected(signal_emited):
	if signal_emited == Constants.SCENE_MANAGER_MICE_CAPTURED_SIGNAL:
		cats_are_running = false
		save_time()
	elif signal_emited == Constants.SCENE_MANAGER_NEW_MAZES_START_SIGNAL:
		cats_are_running = true
		time_label.visible = true
		print("!")
		prepare_time_level()
	elif signal_emited == Constants.PAUSE_MENU_SIGNAL:
		cats_are_running = !cats_are_running

func prepare_time_level():
	load_variables()
	time_in_level = const_level_time - level_index * const_time_multiplier
	if time_in_level < minimum_time:
		time_in_level = minimum_time
	time_label.text = format_time(time_in_level)

func load_variables():
	const_level_time = Constants.DEFAULT_TIME_PER_LEVEL
	const_time_multiplier = Constants.TIME_PER_LEVEL_TO_SUSTRACT
	time_treshold = Constants.TRESHOLD_TIME
	minimum_time = Constants.MINIMUM_TIME_PER_LEVEL
	level_index = data_manager.return_level_index()
	treshold_reached = false


func _process(delta):
	if time_in_level > 0 and cats_are_running:
		time_in_level -= delta
		time_label.text = format_time(time_in_level)
		check_for_treshold()
	elif time_in_level <= 0:
		time_label.text = "0.0"
		Time_Signal.emit(self, Constants.TIME_MANAGER_NEW_MAZES_TIMEOUT_SIGNAL)

func check_for_treshold():
	if time_in_level < time_treshold and not treshold_reached:
		Time_Signal.emit(self, Constants.TIME_MANAGER_TRESHOLD_REACHED_SIGNAL)
		treshold_reached = true

func get_remaining_time():
	return time_in_level

func save_time():
	data_manager.add_actual_level_time(time_in_level)

func format_time(time: float) -> String:
	var formatted_time = str(snapped(time, 0.1))
	if len(formatted_time.split(".")) == 1:
		formatted_time += ".0"
	return formatted_time
	
