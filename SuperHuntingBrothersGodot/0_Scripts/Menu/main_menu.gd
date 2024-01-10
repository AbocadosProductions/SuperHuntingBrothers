extends Control

@onready var normal_menu : Node2D = $normal_menu
@onready var credits_menu : Node2D = $credits_menu
@onready var difficulty_menu : Node2D = $difficulty_menu
@onready var data_manager : Node2D = $DataManager
@onready var audio_bus := AudioServer.get_bus_index(Constants.AUDIO_BUS)


func _ready():
	normal_menu.focus()

func _on_play_button_pressed():
	normal_menu.set_visible(false)
	difficulty_menu.set_visible(true)
	difficulty_menu.focus()

func _on_volumen_slider_value_changed(_value):
	var value = - Constants.MINIMUM_DB_VALUE + Constants.MINIMUM_DB_VALUE * _value * 0.01
	if value < - Constants.MINIMUM_DB_VALUE * 0.95 :
		value = -80
	AudioServer.set_bus_volume_db(audio_bus, value)

func _on_credits_button_pressed():
	normal_menu.set_visible(false)
	credits_menu.set_visible(true)
	credits_menu.focus()

func _on_quit_button_pressed():
	get_tree().quit()

func _on_back_to_menu_button_pressed():
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
