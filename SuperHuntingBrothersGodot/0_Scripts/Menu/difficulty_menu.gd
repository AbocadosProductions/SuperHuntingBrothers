extends Node2D

@onready var button : Button = $easy_mode


func focus():
	button.grab_focus()
