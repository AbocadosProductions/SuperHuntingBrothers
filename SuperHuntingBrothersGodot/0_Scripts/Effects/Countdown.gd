extends Sprite2D

@onready var anim : AnimationPlayer = $AnimationPlayer
@export var scene_manager : Node2D
@export var music_manager : Node2D

signal External_Signal

func ended():
	External_Signal.emit(self, Constants.END_COUNTDOWN)

func _ready():
	scene_manager.External_Signal.connect(scene_manager_signal_detected)
	anim.play(Constants.ANIMATION_COUNTDOWN)
	music_manager.play(Constants.COUNTDOWN_EFFECT)

func scene_manager_signal_detected(signal_emited):
	if signal_emited == Constants.SCENE_MANAGER_NEW_MAZES_PREPARATION_SIGNAL:
		anim.play(Constants.ANIMATION_COUNTDOWN)
		music_manager.play(Constants.COUNTDOWN_EFFECT)
