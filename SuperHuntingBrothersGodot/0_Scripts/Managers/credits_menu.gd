extends Node2D

@onready var button : Button = $back_to_menu_button


func focus():
	button.grab_focus()
