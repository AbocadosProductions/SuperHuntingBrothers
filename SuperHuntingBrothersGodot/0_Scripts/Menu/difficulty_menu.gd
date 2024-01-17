extends Node2D

@onready var button : Button = $difficulty_menu_panel/HBoxContainer/normal_mode


func focus():
	button.grab_focus()
