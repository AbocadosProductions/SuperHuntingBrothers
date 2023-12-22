extends State

const SPEED = 450.0


var move_direction : Vector2
var flee_time : float

var maze_directions = [Vector2(1, 0), Vector2(0, 1), Vector2(-1, 0), Vector2(0, -1)]
var random_direction = null

var time_since_last_collision = 0
var max_time_since_last_collision = 0.01

var collisions = []
var valids_directions = []
var last_time_collision = 0

@export var mouse : CharacterBody2D


func randomize_flee():
	random_direction = maze_directions[randi() % maze_directions.size()]

func Enter():
	mouse.mouse_is_fleing = true
	randomize_flee()
	mouse.External_Signal.emit(Constants.ANIMATION_RELEASE)
	mouse.mouse_state_machine_signal.connect(on_mouse_signal_detected)
		
func Exit():
	mouse.mouse_is_fleing = false
	flee_time = 0
	mouse.mouse_state_machine_signal.disconnect(on_mouse_signal_detected)

func Update(_delta : float):
	if flee_time < Constants.MAX_FLEE_TIME:
		time_since_last_collision += _delta
		flee_time += _delta
	else:
		Transition.emit(self, "idle")
	last_time_collision += _delta
	if last_time_collision > 0.1:
		collisions.pop_at(0)
 

func Physics_Update(_delta : float):
	mouse.velocity = random_direction * SPEED


func on_mouse_signal_detected(signal_data):
	if Constants.WALL_PREFIX == signal_data:
		change_moving_direction()

	if Constants.PAUSE_MENU_SIGNAL == signal_data:
		Transition.emit(self, Constants.PAUSE_MENU_SIGNAL)

func change_moving_direction():
	# Update last collisions list
	if random_direction not in collisions:
		collisions.append(random_direction)
	# Refresh time since last collision
	last_time_collision = 0
	# Get possibles directions according to last collisions
	for dir in maze_directions:
		if dir not in collisions:
			valids_directions.append(dir)
	# Pick one of the possible directions if possible
	if valids_directions.size() != 0:
		random_direction = valids_directions[randi() % valids_directions.size()]
	else:
		random_direction = maze_directions[randi() % maze_directions.size()]
	# Send signals
	mouse.direction = Constants.DIRECTIONS[random_direction]
	mouse.External_Signal.emit(Constants.ANIMATION_RUN)
	# Reset valid directions list
	valids_directions = []
