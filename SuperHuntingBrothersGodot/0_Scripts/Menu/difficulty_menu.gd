extends Node2D

@onready var button : Button = $Panel/HBoxContainer/normal_mode


func focus():
	button.grab_focus()
