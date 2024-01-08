extends Node2D


@onready var button : Button = $CenterContainer/VBoxContainer/play_button


func focus():
	button.grab_focus()
