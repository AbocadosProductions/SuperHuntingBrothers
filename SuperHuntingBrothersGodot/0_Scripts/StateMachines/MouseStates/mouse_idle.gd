extends State


const SPEED = 25.0

var move_direction : Vector2
var wander_time : float

var maze_directions = [Vector2(1, 0), Vector2(0, 1), Vector2(-1, 0), Vector2(0, -1)]
var random_direction = null

@export var mouse : CharacterBody2D


func randomize_wander():
	random_direction = maze_directions[randi() % maze_directions.size()]
	mouse.direction = Constants.DIRECTIONS[random_direction]
	mouse.External_Signal.emit(Constants.ANIMATION_RUN)
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
	if Constants.WALL_PREFIX == signal_data:
		randomize_wander()

	if Constants.MOUSE_CAT_DETECTED_SIGNAL == signal_data:
		Transition.emit(self, Constants.MOUSE_CAT_DETECTED_SIGNAL)

	if Constants.SCENE_MANAGER_MICE_CAPTURED_SIGNAL == signal_data:
		Transition.emit(self, Constants.SCENE_MANAGER_MICE_CAPTURED_SIGNAL)

	if Constants.PAUSE_MENU_SIGNAL == signal_data:
		Transition.emit(self, Constants.PAUSE_MENU_SIGNAL)
