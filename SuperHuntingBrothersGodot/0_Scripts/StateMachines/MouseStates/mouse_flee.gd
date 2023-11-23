extends State
class_name MouseIdle

const WALL_NAME = "wall"
const SPEED = 300.0
const MAX_FLEE_TIME = 1.5

var move_direction : Vector2
var flee_time : float

var maze_directions = [Vector2(1, 0), Vector2(0, 1), Vector2(-1, 0), Vector2(0, -1)]
var random_direction = null

@export var mouse : CharacterBody2D


func randomize_flee():
	random_direction = maze_directions[randi() % maze_directions.size()]

func Enter():
	mouse.mouse_is_fleing = true
	randomize_flee()
	mouse.Collision.connect(on_collision_detected)
		
func Exit():
	mouse.mouse_is_fleing = false
	flee_time = 0

func Update(_delta : float):
	if flee_time < MAX_FLEE_TIME:
		flee_time += _delta
	else:
		Transition.emit(self, "idle")


func Physics_Update(_delta : float):
	mouse.velocity = random_direction * SPEED

func on_collision_detected(collision_data):
	if WALL_NAME == collision_data:
		randomize_flee()

