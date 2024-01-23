extends Control

@export var datamanager : Node2D

@export var actual_time_label : Label
@export var record_time_label : Label
@export var points_label : Label
@export var new_record_announcer : Node2D
@export var scene_manager : Node2D

@onready var next_level_button : Button = $Panel/next_level_button
@onready var timer : Timer = $Timer
@onready var array = [next_level_button]

var func_to_call 
var pressed_button



signal External_Signal

# Variables to show in the UI
var updated_points : float
var record_time : int
var actual_time : int

# Variables to control the point_scene loop
var level_index : int
var record_points : int
var record_index : int
var multiplier : float
var multiplier_per_level_constant : float
var points_obtained_in_this_level : float
var punctuation_steps : int
var points_per_step : float
var added_points_in_last_frame = false
var can_go_to_next_level = false

# Variables to format time labels
var minutes : int
var seconds : int
var formated_time_formula : String
var formated_time : String

var moving_step : int
var initial_transform : float
var showing_transform : float
var final_transform : float
var is_showing_points = false
var is_moving_to_the_screen = false
var is_moving_out_the_screen = false

func initialize_variables():
	# Load data from data manager
	updated_points = datamanager.return_points()
	actual_time = datamanager.return_last_level_time()
	record_time = datamanager.return_record_time()
	level_index = datamanager.return_level_index()

	record_points = datamanager.return_record_points()
	record_index = datamanager.return_record_level_index()

	# Load data from constants
	multiplier_per_level_constant = Constants.PUNCTUATION_MULTIPLIER_PER_LEVEL
	multiplier = multiplier_per_level_constant * level_index
	punctuation_steps = Constants.PUNCTUATION_UPDATE_STEPS

	initial_transform = Constants.PUNCTUATION_INITIAL_TRANSFORM
	moving_step = Constants.PUNCTUATION_MOVING_STEPS
	showing_transform = Constants.PUNCTUATION_SHOWING_TRANSFORM
	final_transform = Constants.PUNCTUATION_FINAL_TRANSFORM


	# Display initial info in labels
	set_time_values_in_labels()
	get_points_obtained_in_level()

func _ready():
	scene_manager.External_Signal.connect(scene_manager_signal_detected)
	for child in array:
		child.focus_mode = Control.FOCUS_NONE

func scene_manager_signal_detected(signal_emited):
	if signal_emited == "show_points":
		is_moving_to_the_screen = true
		initialize_variables()

# FUNCTIONS NEEDED TO DISPLAY BETTER THE INFO IN THE LABELS (FORMAT INTS TO TIME)
func set_time_values_in_labels():
	actual_time_label.text = format_time(actual_time)
	if record_time == 0: 
		record_time_label.text = ""
	else:
		record_time_label.text = format_time(record_time)

func format_time(time: int):
	@warning_ignore("integer_division")
	minutes = int(time / 60)
	seconds = time - minutes * 60 
	
	if minutes != 0:
		if seconds != 0:
			formated_time_formula = Constants.MINUTES_AND_SECONDS_FORMAT_STRING
			formated_time = formated_time_formula % [minutes, seconds]
		else:
			formated_time_formula = Constants.MINUTES_FORMAT_STRING
			formated_time = formated_time_formula % [minutes]
	else:
		formated_time_formula = Constants.SECONDS_FORMAT_STRING
		formated_time = formated_time_formula % [seconds]

	return formated_time


 # POINTS TO BE ADDED TO THE PUNCTUATION LABEL

func get_points_obtained_in_level():
	points_obtained_in_this_level = actual_time * multiplier
	points_per_step = points_obtained_in_this_level / punctuation_steps

func _process(_delta):
	if is_showing_points:
		# Updates the punctuation label
		if points_obtained_in_this_level > 0:
			if added_points_in_last_frame:
				added_points_in_last_frame = false
			else:
				points_obtained_in_this_level -= points_per_step
				updated_points += points_per_step
				points_label.text = str(int(updated_points))
				added_points_in_last_frame = true
		# When ends, activates next level button and checks for record
		else:
			for child in array:
				child.focus_mode = Control.FOCUS_ALL
			next_level_button.grab_focus()
			can_go_to_next_level = true
			check_for_record()
			is_showing_points = false

	elif is_moving_to_the_screen:
		if position[0] < showing_transform:
			position[0] += moving_step
		else:
			is_showing_points = true
			is_moving_to_the_screen = false

	elif is_moving_out_the_screen:
		if position[0] < final_transform:
			position[0] += moving_step
		else:
			External_Signal.emit(self, Constants.NEW_RECORD_SIGNAL)
			is_moving_out_the_screen = false
			position[0] = initial_transform

# CONTROLS THE RECORD SPRITES AND THE RECORD LABEL WHEN POINTS FINISH TO BE UPDATED
func check_for_record():
	if actual_time < record_time or record_time == 0:
		datamanager.set_new_record_time()
		External_Signal.emit(self, Constants.NEW_RECORD_SIGNAL)
		record_time_label.text = format_time(actual_time)
	
	if updated_points > record_points:
		datamanager.set_points(updated_points)
		datamanager.set_new_record_points()
		
	if level_index > record_index:
		datamanager.set_new_record_level_index()

# LISTEN TO THE BUTTON SIGNAL AND WAITS FOR THE LOOP TO END
func _on_next_level_button_pressed():
	start_timer()
	pressed_button = next_level_button
	func_to_call = "next_level_funct"

func start_timer():
	timer.start()
	for child in array:
		child.focus_mode = Control.FOCUS_NONE

func next_level_funct():
	if can_go_to_next_level:
		is_moving_out_the_screen = true
		datamanager.set_points(updated_points)
		External_Signal.emit(self, Constants.POINTS_MENU_FINISHED_SIGNAL)



func _on_timer_timeout():
	pressed_button.button_pressed = false
	for child in array:
		child.focus_mode = Control.FOCUS_ALL
	call(func_to_call)
