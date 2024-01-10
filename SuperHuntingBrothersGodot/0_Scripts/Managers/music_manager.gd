extends Node2D

@onready var music_player : AudioStreamPlayer2D = $music
@onready var effect_player : AudioStreamPlayer2D = $effects
@export var scene_manager : Node2D

func play_effect(track: String):
	effect_player.stream = load(track)
	effect_player.play()

func play_music(track: String):
	music_player.stream = load(track)
	music_player.play()

#func _ready():
#	scene_manager.External_Signal.connect(scene_manager_signal_detected)

func scene_manager_signal_detected(signal_emited):
	if signal_emited in Constants.MUSIC_SIGNALS:
		play_music(signal_emited)
	elif signal_emited in Constants.EFFECT_SIGNALS:
		play_effect(signal_emited)
