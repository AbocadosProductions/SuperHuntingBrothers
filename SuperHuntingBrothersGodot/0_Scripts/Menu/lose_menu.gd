extends Control

@onready var actual_punctuation_label : Label = $Panel/actual_punctuation/punctuation_label
@onready var record_punctuation_label : Label = $Panel/record_punctuation_label/punctuation_label
@onready var actual_level_label : Label = $Panel/actual_level/punctuation_label
@onready var record_level_label : Label = $Panel/record_level_label/punctuation_label

@onready var new_record_punctuation_announcer : Node2D = $Panel/new_punctuation_record
@onready var new_record_level_announcer : Node2D = $Panel/new_level_record
@onready var data_manager : Node2D = $DataManager
@onready var main_menu_button : Button = $Panel/main_menu_button
@onready var retry_button : Button = $Panel/retry_button
@onready var timer : Timer = $Timer
@onready var array = [main_menu_button, retry_button]

var new_record_points = false
var new_record_level = false

var updated_points
var record_points
var level_index
var record_index

var func_to_call 
var pressed_button

signal External_Signal

func _ready():
	for child in array:
		child.focus_mode = Control.FOCUS_ALL

	main_menu_button.grab_focus()

	# Load data from data manager
	updated_points = data_manager.return_points()
	record_points = data_manager.return_record_points()
	level_index = data_manager.return_level_index()
	record_index = data_manager.return_record_level_index()

	if updated_points > record_points:

		data_manager.set_new_record_points()
		new_record_points = true
	if level_index > record_index:

		data_manager.set_new_record_level_index()
		new_record_level = true
	
	
	actual_punctuation_label.text = str(updated_points)
	record_punctuation_label.text = str(record_points)
	actual_level_label.text = str(level_index)
	record_level_label.text = str(record_index)

	
func main_menu_funct():
	data_manager.reset_data_from_run()
	get_tree().change_scene_to_file(Constants.MAIN_MENU)
	
func retry_funct():
	data_manager.reset_data_from_run()
	get_tree().change_scene_to_file(Constants.FIRST_LEVEL)


func start_timer():
	timer.start()
	for child in array:
		child.focus_mode = Control.FOCUS_NONE

func _on_button_pressed():
	start_timer()
	pressed_button = main_menu_button
	func_to_call = "main_menu_funct"


func _on_retry_button_pressed():
	start_timer()
	pressed_button = retry_button
	func_to_call = "retry_funct"


func _on_timer_timeout():
	pressed_button.button_pressed = false
	for child in array:
		child.focus_mode = Control.FOCUS_ALL
	call(func_to_call)


func _on_update_timer_timeout():
	if new_record_points:
		record_punctuation_label.text = str(updated_points)
		External_Signal.emit(self, Constants.END_MENU_POINTS_RECORD_SIGNAL)
	if new_record_level:
		External_Signal.emit(self, Constants.END_MENU_LEVEL_RECORD_SIGNAL)
		record_level_label.text = str(level_index)
