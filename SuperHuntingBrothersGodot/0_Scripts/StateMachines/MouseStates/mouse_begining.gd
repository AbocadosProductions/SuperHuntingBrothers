extends State

var begining_time : float

@export var mouse : CharacterBody2D


func Enter():
	mouse.velocity = Vector2(0, 0)
	mouse.External_Signal.emit(Constants.ANIMATION_BEGGINING_RIGHT)

func Exit():
	begining_time = 0

func Update(_delta : float):
	if begining_time < Constants.MAX_BEGINING_TIME:
		begining_time += _delta
	else:
		Transition.emit(self, "idle")
