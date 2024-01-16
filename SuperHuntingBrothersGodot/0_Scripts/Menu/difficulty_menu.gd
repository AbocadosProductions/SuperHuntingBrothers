extends Node2D

@onready var button : Button = $Panel/tutorial


func focus():
	button.grab_focus()
