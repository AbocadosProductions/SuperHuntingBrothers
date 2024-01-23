extends Node2D


@onready var button : Button = $Menu/VBoxContainer/play_button

@onready var effects : AudioStreamPlayer2D = $Effects

func focus():
	button.grab_focus()


func _on_play_button_focus_entered():
	effects.play()


func _on_tutorial_focus_entered():
	effects.play()


func _on_volumen_slider_focus_entered():
	effects.play()


func _on_credits_button_focus_entered():
	effects.play()


func _on_quit_button_focus_entered():
	effects.play()
