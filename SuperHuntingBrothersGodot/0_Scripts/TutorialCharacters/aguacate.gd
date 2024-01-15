extends CharacterBody2D

const SPEED = 200.0

var character_controls = null
var character_left = null
var character_right = null
var character_up = null
var character_down = null

var move_direction = null
var direction = Constants.DIRECTIONS[Vector2(1, 0)]



const CONTROLS = {
	"keyboard": ["keyboard_left", "keyboard_right", "keyboard_up", "keyboard_down"],
	"arrows": ["arrow_left", "arrow_right", "arrow_up", "arrow_down"] 
}

@export var type_of_control: String

signal External_Signal

func get_controllers():
	character_controls = CONTROLS[type_of_control]
	character_left = character_controls[0]
	character_right = character_controls[1]
	character_up = character_controls[2]
	character_down = character_controls[3]

func _ready():
	get_controllers()

func _physics_process(delta):
	move_direction = Input.get_vector(character_left, character_right, character_up, character_down)
	ortogonalize_direction()
	set_direction()
	send_animation_signal()
	velocity = move_direction * SPEED
	move_and_slide()


func ortogonalize_direction():
	if move_direction[0] != 0 and move_direction[1] != 0:
		move_direction[0] = ceil(move_direction[0])
		move_direction[1] = 0

func set_direction():
	if move_direction != Vector2(0, 0):
		direction = Constants.DIRECTIONS[move_direction]

func send_animation_signal():
	if move_direction != Vector2(0, 0):
		External_Signal.emit(Constants.ANIMATION_RUN)
	else:
		External_Signal.emit(Constants.ANIMATION_IDLE)
