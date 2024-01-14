extends Node2D

@onready var button : Button = $Panel/back_to_menu_button


func focus():
	button.grab_focus()
