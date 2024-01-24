extends Control

signal External_Signal

var visibility : bool = false
var func_to_call 
var pressed_button
@onready var timer : Timer = $Timer

@onready var continue_button : Button = $Panel/continue_button
@onready var back_button : Button = $Panel/back_to_menu_button
@onready var array = [continue_button, back_button]
@onready var audio_bus := AudioServer.get_bus_index(Constants.AUDIO_BUS)
@onready var volumen_slider : HSlider = $Panel/volumen_slider

@export var scene_manager : Node2D
@export var music_manager : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	self.set_visible(visibility)
	scene_manager.External_Signal.connect(scene_manager_signal_detected)
	set_volume_bar()

func _input(event):
	if event.is_action_pressed("pause"):
		External_Signal.emit(self, Constants.PAUSE_MENU_SIGNAL)

func _on_back_to_menu_button_pressed():
	start_timer()
	music_manager.play(Constants.BUTTON_PRESSED_EFFECT)
	pressed_button = back_button
	func_to_call = "quit_funct"

func _on_continue_button_pressed():
	start_timer()
	music_manager.play(Constants.BUTTON_PRESSED_EFFECT)
	pressed_button = continue_button
	func_to_call = "continue_funct"

func _on_volumen_slider_value_changed(_value):
	var value = - Constants.MINIMUM_DB_VALUE + Constants.MINIMUM_DB_VALUE * _value * 0.01
	if value < - Constants.MINIMUM_DB_VALUE * 0.95 :
		value = -80
	AudioServer.set_bus_volume_db(audio_bus, value)

func scene_manager_signal_detected(signal_emited):
	if signal_emited == Constants.PAUSE_MENU_SIGNAL:
		visibility = !visibility
		self.set_visible(visibility)
		continue_button.grab_focus()

func continue_funct():
	External_Signal.emit(self, Constants.PAUSE_MENU_SIGNAL)
	self.set_visible(visibility)

func quit_funct():
	get_tree().change_scene_to_file(Constants.MAIN_MENU)

func start_timer():
	timer.start()
	for child in array:
		child.focus_mode = Control.FOCUS_NONE


func _on_timer_timeout():
	pressed_button.button_pressed = false
	for child in array:
		child.focus_mode = Control.FOCUS_ALL
	call(func_to_call)

func set_volume_bar():
	var value = AudioServer.get_bus_volume_db(0)
	if value == -80:
		value = 0
	else:
		value = (value + Constants.MINIMUM_DB_VALUE) / Constants.MINIMUM_DB_VALUE * 100
	volumen_slider.set_value_no_signal(value)

func _focus_entered():
	music_manager.play(Constants.BUTTON_FOCUS_EFFECT)
