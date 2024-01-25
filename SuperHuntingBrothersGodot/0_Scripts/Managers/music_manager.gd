extends Node2D

@export var music_player : AudioStreamPlayer2D
@export var effect_player : AudioStreamPlayer2D
@export var effect_background_player : AudioStreamPlayer2D

var time = 0

func play_effect(track: String):
	effect_player.stream = load(track)
	effect_player.play()

func play_effect_background(track: String):
	effect_background_player.stream = load(track)
	effect_background_player.play()

func play_music(track: String):
	music_player.stream = load(track)
	music_player.play(time)

func play(audio_to_play: String, time_to_play = null):
	if time_to_play != null:
		time = time_to_play
	else:
		time = 0
	if audio_to_play in Constants.MUSIC_SIGNALS:
		play_music(audio_to_play)
	elif audio_to_play in Constants.EFFECT_SIGNALS:
		play_effect(audio_to_play)
	elif audio_to_play in Constants.EFFECT_BACKGROUND_SIGNALS:
		play_effect_background(audio_to_play)

func pause():
	music_player.set_stream_paused(true)
	effect_background_player.set_stream_paused(true)

func continue_playing():
	music_player.set_stream_paused(false)
	effect_background_player.set_stream_paused(false)

func get_music_time():
	return int(music_player.get_playback_position())
