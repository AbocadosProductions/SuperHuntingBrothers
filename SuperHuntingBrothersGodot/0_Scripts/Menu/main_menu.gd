extends Control

@export var normal_menu : Node2D
@export var credits_menu : Node2D


func _on_play_button_pressed():
	get_tree().change_scene_to_file(Constants.FIRST_LEVEL)

func _on_volumen_slider_value_changed(_value):
	pass # Replace with call to audio controller

func _on_credits_button_pressed():
	normal_menu.set_visible(false)
	credits_menu.set_visible(true)

func _on_quit_button_pressed():
	get_tree().quit()


func _on_back_to_menu_button_pressed():
	normal_menu.set_visible(true)
	credits_menu.set_visible(false)
