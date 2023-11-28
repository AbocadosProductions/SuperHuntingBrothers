extends State

const MAX_CAPTURE_TIME : float = 2.0

var capture_time : float

@export var mouse : CharacterBody2D


func Enter():
	mouse.velocity = Vector2(0, 0)

