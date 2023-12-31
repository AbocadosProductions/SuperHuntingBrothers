extends Control

@export var first_block : Node2D
@export var second_block : Node2D
@export var next_button : Button
@export var menu_button : Button
@export var play_button : Button

var showing_first_block = true
var moving_blocks = false

# Called when the node enters the scene tree for the first time.
func _ready():
	menu_button.set_visible(false)
	play_button.set_visible(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if moving_blocks:
		first_block.position[1] -= 10
		second_block.position[1] -= 10
		if second_block.position[1] == -80:
			moving_blocks = false
			showing_first_block = false
			menu_button.set_visible(true)
			play_button.set_visible(true)

func _on_next_button_pressed():
	if showing_first_block:
		moving_blocks = true
		next_button.set_visible(false)


func _on_menu_button_pressed():
	get_tree().change_scene_to_file(Constants.MAIN_MENU)


func _on_play_button_pressed():
	get_tree().change_scene_to_file(Constants.FIRST_LEVEL)
