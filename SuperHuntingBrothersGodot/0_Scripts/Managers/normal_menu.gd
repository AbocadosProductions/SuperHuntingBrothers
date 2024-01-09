extends Node2D


@onready var button : Button = $VBoxContainer/play_button


func focus():
	button.grab_focus()
