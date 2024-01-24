extends Node2D

@export var music_player : AudioStreamPlayer2D
@export var effect_player : AudioStreamPlayer2D

func play_effect(track: String):
	effect_player.stream = load(track)
	effect_player.play()

func play_music(track: String):
	music_player.stream = load(track)
	music_player.play()

func play(audio_to_play: String):
	if audio_to_play in Constants.MUSIC_SIGNALS:
		play_music(audio_to_play)
	elif audio_to_play in Constants.EFFECT_SIGNALS:
		play_effect(audio_to_play)
