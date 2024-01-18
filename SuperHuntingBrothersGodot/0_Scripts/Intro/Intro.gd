extends Node2D

@onready var logo : Sprite2D = $Logo
@onready var reminder : Node2D = $reminder
@onready var timer_logo : Timer = $TimerLogo
@onready var timer_label : Timer = $TimerLabel

var show_logo = false
var hide_logo = false
var show_remminder = false
var hide_remminder = false
var opacity = 0.01

# Called when the node enters the scene tree for the first time.
func _ready():
	logo.visible = false
	reminder.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if show_logo:
		if opacity < 1:
			opacity += 0.01
			logo.modulate = Color(1, 1, 1, opacity)
		if opacity >= 1:
			show_logo = false
			timer_logo.start()

	if hide_logo:
		if opacity > 0 :
			opacity -= 0.01
			logo.modulate = Color(1, 1, 1, opacity)
		if opacity <= 0:
			show_logo = false
			hide_logo = false
			show_remminder = true
			opacity = 0.01
			reminder.visible = true
	if show_remminder:
		if opacity < 1:
			opacity += 0.01
			reminder.modulate = Color(1, 1, 1, opacity)
		if opacity >= 1:
			show_remminder = false
			timer_label.start()

func _on_timer_timeout():
	show_logo = true
	logo.visible = true
	logo.modulate = Color(1, 1, 1, opacity)


func _on_timer_logo_timeout():
	hide_logo = true

func _on_timer_label_timeout():
	get_tree().change_scene_to_file(Constants.MAIN_MENU)