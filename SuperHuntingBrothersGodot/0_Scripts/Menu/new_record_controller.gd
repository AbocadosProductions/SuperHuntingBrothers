extends Node2D

@export var points_menu : Control
@export var record_sprites : Array

var new_record : bool = false
var new_record_is_hidden : bool = false

var counter = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	points_menu.External_Signal.connect(points_menu_signal_detected)
	for child in get_children():
		child.set_visible(new_record_is_hidden)

func _process(delta):
	if new_record:
		blink_sprites()

func points_menu_signal_detected(signal_emited):
	if signal_emited == "new_record":
		new_record = true

func blink_sprites():
	counter += 1
	if counter > 6:
		counter = 0
		new_record_is_hidden = !new_record_is_hidden
		for child in get_children():
			child.set_visible(new_record_is_hidden)
