extends State

const MAX_CAPTURE_TIME :float = 2.0

var capture_time : float

@export var cat : CharacterBody2D


func Enter():
	cat.velocity = Vector2(0, 0)

func Update(_delta : float):
	if capture_time < MAX_CAPTURE_TIME:
		capture_time += _delta
	else:
		Transition.emit(self, "manual_control")

func Exit():
	capture_time = 0

