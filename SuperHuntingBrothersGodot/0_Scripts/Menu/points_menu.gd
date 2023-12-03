extends Control

@export var datamanager : Node2D

@export var actual_time_label : Label
@export var record_time_label : Label
@export var points_label : Label
@export var new_record_announcer : Node2D

signal External_Signal

# Variables to show in the UI
var updated_points : float
var record_time : int
var actual_time : int

# Variables to control the point_scene loop
var level_index : int
var multiplier : float
var multiplier_per_level_constant : float
var points_obtained_in_this_level : float
var steps : int
var points_per_step : float
var added_points_in_last_frame = false
var can_go_to_next_level = false

# Variables to format time labels
var minutes : int
var seconds : int
var formated_time_formula : String
var formated_time : String


func _ready():
	# Load data from data manager
	updated_points = datamanager.return_points()
	actual_time = datamanager.return_last_level_time()
	record_time = datamanager.return_record_data()
	level_index = datamanager.return_level_index()
	
	# Load data from constants
	multiplier_per_level_constant = Constants.PUNCTUATION_MULTIPLIER_PER_LEVEL
	multiplier = multiplier_per_level_constant * level_index
	steps = Constants.PUNCTUATION_UPDATE_STEPS
	
	# Display initial info in labels
	set_time_values_in_labels()
	get_points_obtained_in_level()


# FUNCTIONS NEEDED TO DISPLAY BETTER THE INFO IN THE LABELS (FORMAT INTS TO TIME)
func set_time_values_in_labels():
	actual_time_label.text = format_time(actual_time)
	if record_time == 0: 
		record_time_label.text = ""
	else:
		record_time_label.text = format_time(record_time)

func format_time(time:int):
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
	points_per_step = points_obtained_in_this_level / steps


@warning_ignore("unused_parameter")
func _process(delta):
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
		can_go_to_next_level = true
		check_for_record()

# CONTROLS THE RECORD SPRITES AND THE RECORD LABEL WHEN POINTS FINISH TO BE UPDATED
func check_for_record():
	if actual_time < record_time or record_time == 0:
		datamanager.set_new_record_points()
		External_Signal.emit("new_record")
		record_time_label.text = format_time(actual_time)

# LISTEN TO THE BUTTON SIGNAL AND WAITS FOR THE LOOP TO END
func _on_next_level_button_pressed():
	if can_go_to_next_level:
		datamanager.set_points(updated_points)

