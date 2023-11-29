extends State


const WALL_NAME = "wall"
const CAT_NAME = "cat"
const SPEED = 100.0

var move_direction : Vector2
var wander_time : float

var maze_directions = [Vector2(1, 0), Vector2(0, 1), Vector2(-1, 0), Vector2(0, -1)]
var random_direction = null

@export var mouse : CharacterBody2D


func randomize_wander():
	random_direction = maze_directions[randi() % maze_directions.size()]
	wander_time = randf_range(1, 2)
	
func Enter():
	randomize_wander()
	mouse.mouse_state_machine_signal.connect(on_mouse_signal_detected)

func Exit():
	mouse.mouse_state_machine_signal.disconnect(on_mouse_signal_detected)

func Update(_delta : float):
	if wander_time > 0:
		wander_time -= _delta
	else:
		randomize_wander()

func Physics_Update(_delta : float):
	mouse.velocity = random_direction * SPEED

func on_mouse_signal_detected(signal_data):
	if WALL_NAME == signal_data:
		randomize_wander()
			
	if CAT_NAME == signal_data:
		Transition.emit(self, "captured")
			
	if "mice_captured" == signal_data:
		Transition.emit(self, "mice_captured")

			
