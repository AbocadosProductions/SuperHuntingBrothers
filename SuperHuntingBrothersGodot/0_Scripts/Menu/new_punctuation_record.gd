extends Node2D

@export var lose_menu : Control
var new_record : bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	new_record = false
	lose_menu.External_Signal.connect(lose_menu_signal_detected)
	for child in get_children():
		child.set_visible(new_record)


func lose_menu_signal_detected(_emisioner, signal_emited):
	if signal_emited == Constants.END_MENU_POINTS_RECORD_SIGNAL:
		new_record = !new_record
		for child in get_children():
			child.set_visible(new_record)
		play_anim()

func play_anim():
	for child in get_children():
		child.play()
