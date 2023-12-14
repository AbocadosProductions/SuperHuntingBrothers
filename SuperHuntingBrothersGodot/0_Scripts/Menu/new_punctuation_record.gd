extends Node2D

@export var lose_menu : Control

var new_record : bool = false
var new_record_is_hidden : bool = false

var counter = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	lose_menu.External_Signal.connect(lose_menu_signal_detected)
	for child in get_children():
		child.set_visible(new_record_is_hidden)
	new_record = false

func _process(_delta):
	if new_record:
		blink_sprites()

func lose_menu_signal_detected(_emisioner, signal_emited):
	if signal_emited == Constants.END_MENU_LEVEL_RECORD_SIGNAL:
		new_record = !new_record

func blink_sprites():
	counter += 1
	if counter > Constants.NEW_RECORD_BLINK_RATE:
		counter = 0
		new_record_is_hidden = !new_record_is_hidden
		for child in get_children():
			child.set_visible(new_record_is_hidden)
