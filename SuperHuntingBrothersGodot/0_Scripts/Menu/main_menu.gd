extends Control


func _on_play_button_pressed():
	get_tree().change_scene_to_file(Constants.FIRST_LEVEL)

func _on_volumen_slider_value_changed(_value):
	pass # Replace with call to audio controller

func _on_credits_button_pressed():
	# get_tree().change_scene_to_file(Constants.CREDITS)
	pass

func _on_quit_button_pressed():
	get_tree().quit()
