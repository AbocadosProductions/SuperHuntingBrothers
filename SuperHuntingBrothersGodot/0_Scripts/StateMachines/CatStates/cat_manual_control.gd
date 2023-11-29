extends State

const SPEED = 300.0
const MOUSE_NAME = "mouse"

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
	cat.velocity = direction * SPEED

func on_cat_signal_detected(signal_data):
	if "mice_captured" == signal_data:
		Transition.emit(self, "mice_captured")
	if MOUSE_NAME == signal_data:
		Transition.emit(self, "mouse_captured")

