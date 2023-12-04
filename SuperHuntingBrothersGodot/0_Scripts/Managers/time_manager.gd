extends Node2D

var time_in_level
var const_level_time = 60
var level_index = 2
var const_time_multiplier = 3
var cats_are_running = false

@export var time_label : Label
@export var scene_manager : Node2D

signal TimeOut

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

func _process(delta):
	if time_in_level > 0 and cats_are_running:
		time_in_level -= delta
		time_label.text = str(int(time_in_level))
	elif time_in_level <= 0:
		TimeOut.emit("timeout")

func get_remaining_time():
	return time_in_level
