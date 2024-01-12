extends Node2D

@export var points_menu : Control

var new_record : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	points_menu.External_Signal.connect(points_menu_signal_detected)
	new_record = false
	for child in get_children():
		child.set_visible(new_record)

func points_menu_signal_detected(_emisioner, signal_emited):
	if signal_emited == Constants.NEW_RECORD_SIGNAL:
		new_record = !new_record
		for child in get_children():
			child.set_visible(new_record)
		play_anim()

func play_anim():
	for child in get_children():
		child.play()
