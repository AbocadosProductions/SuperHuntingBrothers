extends Control

signal External_Signal

var visibility : bool = false

@export var scene_manager : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	self.set_visible(visibility)
	scene_manager.External_Signal.connect(scene_manager_signal_detected)

func _input(event):
	if event.is_action_pressed("pause"):
		External_Signal.emit(self, Constants.PAUSE_MENU_SIGNAL)


func _on_back_to_menu_button_pressed():
	get_tree().change_scene_to_file(Constants.MAIN_MENU)

func _on_continue_button_pressed():
	External_Signal.emit(self, Constants.PAUSE_MENU_SIGNAL)
	visibility = !visibility
	self.set_visible(visibility)


func _volumen_slider_value_changed(value):
	pass # Replace with function body.

func scene_manager_signal_detected(signal_emited):
	if signal_emited == Constants.PAUSE_MENU_SIGNAL:
		visibility = !visibility
		self.set_visible(visibility)

