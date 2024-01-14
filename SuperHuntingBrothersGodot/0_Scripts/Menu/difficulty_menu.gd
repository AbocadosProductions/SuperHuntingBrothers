extends Node2D

@onready var button : Button = $Panel/VBoxContainer/tutorial


func focus():
	button.grab_focus()
