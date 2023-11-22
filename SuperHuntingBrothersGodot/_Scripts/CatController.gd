extends CharacterBody2D

const SPEED = 300.0

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

func _ready():
	check_controller_exist()
	get_controllers()

func _physics_process(delta):
	direction = Input.get_vector(character_left, character_right, character_up, character_down)
	velocity = direction * SPEED
	move_and_slide()

func check_controller_exist():
	if type_of_control not in CONTROLS:
		type_of_control = CONTROLS.keys()[0]

func get_controllers():
	character_controls = CONTROLS[type_of_control]
	character_left = character_controls[0]
	character_right = character_controls[1]
	character_up = character_controls[2]
	character_down = character_controls[3]
