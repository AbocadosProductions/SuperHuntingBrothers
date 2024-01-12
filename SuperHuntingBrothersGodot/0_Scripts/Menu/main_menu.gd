extends Control

@onready var normal_menu : Node2D = $normal_menu
@onready var credits_menu : Node2D = $credits_menu
@onready var timer : Timer = $Timer
@onready var cred_button : Button = $normal_menu/Menu/VBoxContainer/credits_button
@onready var play_button : Button = $normal_menu/Menu/VBoxContainer/play_button
@onready var quit_button : Button = $normal_menu/Menu/VBoxContainer/quit_button
@onready var back_button : Button = $credits_menu/Panel/back_to_menu_button
@onready var vol_slider : HSlider = $normal_menu/Menu/VBoxContainer/Sonido/volumen_slider
@onready var array = [cred_button, play_button, quit_button, vol_slider, back_button]

var func_to_call 
var pressed_button
@onready var difficulty_menu : Node2D = $difficulty_menu
@onready var data_manager : Node2D = $DataManager
@onready var audio_bus := AudioServer.get_bus_index(Constants.AUDIO_BUS)


func _ready():
	for child in array:
		child.focus_mode = Control.FOCUS_ALL
	normal_menu.focus()
	
func _on_play_button_pressed():
	start_timer()
	pressed_button = play_button
	func_to_call = "play_funct"

func _on_volumen_slider_value_changed(_value):
	var value = - Constants.MINIMUM_DB_VALUE + Constants.MINIMUM_DB_VALUE * _value * 0.01
	if value < - Constants.MINIMUM_DB_VALUE * 0.95 :
		value = -80
	AudioServer.set_bus_volume_db(audio_bus, value)

func _on_credits_button_pressed():
	start_timer()
	pressed_button = cred_button
	func_to_call = "credits_funct"

func _on_quit_button_pressed():
	start_timer()
	pressed_button = quit_button
	func_to_call = "quit_funct"

func _on_back_to_menu_button_pressed():
	start_timer()
	pressed_button = back_button
	func_to_call = "back_funct"

func start_timer():
	timer.start()
	for child in array:
		child.focus_mode = Control.FOCUS_NONE

func _on_timer_timeout():
	pressed_button.button_pressed = false
	for child in array:
		child.focus_mode = Control.FOCUS_ALL
	call(func_to_call)
	
func credits_funct():
	normal_menu.set_visible(false)
	credits_menu.set_visible(true)
	credits_menu.focus()

func play_funct():
	normal_menu.set_visible(false)
	difficulty_menu.set_visible(true)
	difficulty_menu.focus()
	
func quit_funct():
	get_tree().quit()
	
func back_funct():
	normal_menu.set_visible(true)
	credits_menu.set_visible(false)
	normal_menu.focus()

func _on_easy_mode_pressed():
	data_manager.set_difficulty(Constants.EASY_MODE)
	get_tree().change_scene_to_file(Constants.FIRST_LEVEL)

func _on_normal_mode_pressed():
	data_manager.set_difficulty(Constants.NORMAL_MODE)
	get_tree().change_scene_to_file(Constants.FIRST_LEVEL)

func _on_back_menu_pressed():
	normal_menu.set_visible(true)
	difficulty_menu.set_visible(false)
	normal_menu.focus()
