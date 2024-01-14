extends Control

@onready var timer : Timer = $Timer

@export var first_block : Panel
@export var second_block : Panel
@export var next_button : Button
@export var menu_button : Button
@export var play_button : Button
@onready var RatonNormalAnim : AnimatedSprite2D = $Panel/first_to_show/RatonNormal
@onready var RatonCorriendoAnim : AnimatedSprite2D = $Panel/first_to_show/RatonCorriendo
@onready var CattanitaAnim : AnimatedSprite2D = $Panel/second_to_show/Cattanita
@onready var AguacateAnim : AnimatedSprite2D = $Panel/second_to_show/Aguacate

@onready var array = [next_button, menu_button, play_button]

var showing_first_block = true
var moving_blocks = false

var func_to_call 
var pressed_button

func start_timer():
	timer.start()
	for child in array:
		child.focus_mode = Control.FOCUS_NONE

# Called when the node enters the scene tree for the first time.
func _ready():
	next_button.grab_focus()
	menu_button.set_visible(false)
	play_button.set_visible(false)
	RatonNormalAnim.play()
	RatonCorriendoAnim.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if moving_blocks:
		first_block.position[1] -= 3
		second_block.position[1] -= 3
		if second_block.position[1] == 0:
			moving_blocks = false
			showing_first_block = false
			menu_button.set_visible(true)
			play_button.set_visible(true)
			menu_button.grab_focus()
			CattanitaAnim.play()
			AguacateAnim.play()

func _on_menu_button_pressed():
	start_timer()
	pressed_button = menu_button
	func_to_call = "menu_funct"

func menu_funct():
	get_tree().change_scene_to_file(Constants.MAIN_MENU)

func _on_next_button_pressed():
	start_timer()
	pressed_button = next_button
	func_to_call = "next_funct"

func next_funct():
	if showing_first_block:
		moving_blocks = true
		next_button.set_visible(false)

func _on_play_button_pressed():
	start_timer()
	pressed_button = play_button
	func_to_call = "play_funct"

func play_funct():
	get_tree().change_scene_to_file(Constants.FIRST_LEVEL)

func _on_timer_timeout():
	pressed_button.button_pressed = false
	for child in array:
		child.focus_mode = Control.FOCUS_ALL
	call(func_to_call)
	
