extends Node2D

@onready var button : Button = $credits_menu_panel/back_to_menu_button


func focus():
	button.grab_focus()
