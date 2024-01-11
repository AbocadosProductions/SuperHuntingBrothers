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


func _ready():
	normal_menu.focus()
	
func _on_play_button_pressed():
	start_timer()
	pressed_button = play_button
	func_to_call = "play_funct"

func _on_volumen_slider_value_changed(_value):
	pass # Replace with call to audio controller

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
	get_tree().change_scene_to_file(Constants.FIRST_LEVEL)
	
func quit_funct():
	get_tree().quit()
	
func back_funct():
	normal_menu.set_visible(true)
	credits_menu.set_visible(false)
	normal_menu.focus()
