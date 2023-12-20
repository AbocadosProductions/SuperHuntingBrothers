extends Node

@export var animation_player : AnimationPlayer
@export var emisioner : Node2D
var animation_list : Array


func _ready():
	animation_list = animation_player.get_animation_list()
	emisioner.External_Signal.connect(on_signal_detected)

func on_signal_detected(signal_data):
	if signal_data != Constants.ANIMATION_BEGGINING_RIGHT:
		signal_data += emisioner.direction
	if signal_data in animation_list:

		animation_player.play(signal_data)
