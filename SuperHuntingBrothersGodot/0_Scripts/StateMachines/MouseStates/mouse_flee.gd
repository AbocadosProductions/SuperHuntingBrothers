extends State

const speed = 200.0
const accel = 10.0
var flee_time = 0 
var actual_target 

@export var navigator : NavigationAgent2D
@export var mouse : CharacterBody2D


func Enter():
	mouse.play(Constants.FLEE_EFFECT)
	wander()
	mouse.mouse_state_machine_signal.connect(on_mouse_signal_detected)
	mouse.External_Signal.emit(Constants.ANIMATION_RELEASE)
	flee_time = 0 

func Exit():
	mouse.mouse_state_machine_signal.disconnect(on_mouse_signal_detected)

func Update(_delta : float):
	if flee_time < Constants.MAX_FLEE_TIME:
		flee_time += _delta
	else:
		Transition.emit(self, "idle")

func Physics_Update(_delta : float):
	var distance = actual_target - mouse.global_position 
	
	if distance.length() < 20:
		wander()

	var direction = Vector2 ()
	direction = navigator.get_next_path_position() - mouse.global_position 
	direction = direction.normalized()
	update_mouse_direction(direction)
	mouse.velocity = mouse.velocity.lerp(direction * speed, accel * _delta)


func on_mouse_signal_detected(signal_data):
	if Constants.PAUSE_MENU_SIGNAL == signal_data:
		Transition.emit(self, Constants.PAUSE_MENU_SIGNAL)
		mouse.last_state = self.name


func wander():
	var random_x = randi_range(Constants.MIN_X_CELL_RANGE, Constants.MAX_X_CELL_RANGE)
	var random_y = randi_range(Constants.MIN_Y_CELL_RANGE, Constants.MAX_Y_CELL_RANGE)
	actual_target = Vector2((random_x * Constants.CELL_SIZE) - Constants.CELL_SIZE / 2, 
							(random_y * Constants.CELL_SIZE) - Constants.CELL_SIZE / 2)
	actual_target = mouse.set_target_in_maze_coordinates(actual_target)
	navigator.target_position = actual_target


func update_mouse_direction(dir : Vector2):
	if abs(dir).x > 0:
		if dir.x > 0:
			mouse.direction = Constants.DIRECTIONS[Vector2(1,0)]
		else:
			mouse.direction = Constants.DIRECTIONS[Vector2(-1,0)]
	else:
		if dir.y > 0:
			mouse.direction = Constants.DIRECTIONS[Vector2(0,1)]
		else:
			mouse.direction = Constants.DIRECTIONS[Vector2(0,-1)]
	mouse.External_Signal.emit(Constants.ANIMATION_RUN)
