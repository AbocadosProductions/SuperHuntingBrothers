extends Node2D

var time_in_level
var const_level_time
var time_treshold
var level_index
var const_time_multiplier
var cats_are_running = false
var treshold_reached

@export var time_label : Label
@export var scene_manager : Node2D

signal Time_Signal

func _ready():
	scene_manager.External_Signal.connect(scene_manager_signal_detected)
	prepare_time_level()

func scene_manager_signal_detected(signal_emited):
	if signal_emited == "mice_captured":
		cats_are_running = false
	elif signal_emited == "new_maze_start":
			cats_are_running = true

func prepare_time_level():
	load_variables()
	time_in_level = const_level_time - level_index * const_time_multiplier 
	time_label.text = str(int(time_in_level))

func load_variables():
	const_level_time = 60
	level_index = 2
	const_time_multiplier = 3
	time_treshold = 15
	treshold_reached = false

func _process(delta):
	if time_in_level > 0 and cats_are_running:
		time_in_level -= delta
		time_label.text = str(int(time_in_level))
		check_for_treshold()
	elif time_in_level <= 0:
		Time_Signal.emit("timeout")

func check_for_treshold():
	if time_in_level < time_treshold and not treshold_reached:
		Time_Signal.emit("treshold_reached")
		treshold_reached = true

func get_remaining_time():
	return time_in_level

