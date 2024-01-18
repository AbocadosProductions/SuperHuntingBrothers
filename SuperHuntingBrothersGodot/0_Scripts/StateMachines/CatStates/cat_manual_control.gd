extends State

const SPEED = 100.0

var character_controls = null
var character_left = null
var character_right = null
var character_up = null
var character_down = null
var direction = null

const CONTROLS = {
	"keyboard": ["keyboard_left", "keyboard_right", "keyboard_up", "keyboard_down"],
	"arrows": ["arrow_left", "arrow_right", "arrow_up", "arrow_down"] 
}

@export var type_of_control: String

@export var cat : CharacterBody2D


func check_controller_exist():
	if type_of_control not in CONTROLS:
		type_of_control = CONTROLS.keys()[0]

func get_controllers():
	character_controls = CONTROLS[type_of_control]
	character_left = character_controls[0]
	character_right = character_controls[1]
	character_up = character_controls[2]
	character_down = character_controls[3]

func Enter():
	check_controller_exist()
	get_controllers()
	cat.cat_state_machine_signal.connect(on_cat_signal_detected)


func Exit():
	cat.cat_state_machine_signal.disconnect(on_cat_signal_detected)

func Physics_Update(_delta : float):
	direction = Input.get_vector(character_left, character_right, character_up, character_down)
	ortogonalize_direction()
	set_direction()
	send_animation_signal()
	cat.velocity = direction * SPEED

func ortogonalize_direction():
	if direction[0] != 0 and direction[1] != 0:
		direction[0] = ceil(direction[0])
		direction[1] = 0

func set_direction():
	if direction != Vector2(0, 0):
		cat.direction = Constants.DIRECTIONS[direction]

func send_animation_signal():
	if direction != Vector2(0, 0):
		cat.External_Signal.emit(Constants.ANIMATION_RUN)
	else:
		cat.External_Signal.emit(Constants.ANIMATION_IDLE)

func on_cat_signal_detected(signal_data):
	if Constants.SCENE_MANAGER_MICE_CAPTURED_SIGNAL == signal_data:
		Transition.emit(self, Constants.SCENE_MANAGER_MICE_CAPTURED_SIGNAL)
	if Constants.CAT_MOUSE_CAPTURED_SIGNAL == signal_data:
		Transition.emit(self, Constants.CAT_MOUSE_CAPTURED_SIGNAL)
	if Constants.PAUSE_MENU_SIGNAL == signal_data:
		Transition.emit(self, Constants.PAUSE_MENU_SIGNAL)
		cat.last_state = self.name

