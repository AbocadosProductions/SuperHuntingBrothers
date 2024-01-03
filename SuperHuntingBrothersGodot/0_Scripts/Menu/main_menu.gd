extends Control

@onready var normal_menu : Node2D = $normal_menu
@onready var credits_menu : Node2D = $credits_menu

func _ready():
	normal_menu.focus()

func _on_play_button_pressed():
	get_tree().change_scene_to_file(Constants.FIRST_LEVEL)

func _on_volumen_slider_value_changed(_value):
	pass # Replace with call to audio controller

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
