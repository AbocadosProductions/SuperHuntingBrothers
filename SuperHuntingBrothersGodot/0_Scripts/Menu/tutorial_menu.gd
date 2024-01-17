extends Control

@onready var timer : Timer = $Timer

@export var first_block : Panel
@export var second_block : Panel
@export var next_button : Button
@export var menu_button : Button
@export var play_button : Button
@onready var RatonNormalAnim : AnimatedSprite2D = $tutorial_panel/first_to_show/RatonNormal
@onready var TechnoMouse1 : CharacterBody2D = $tutorial_panel/first_to_show/TechnoMouse
@onready var TechnoMouse2 : CharacterBody2D = $tutorial_panel/first_to_show/TechnoMouse2
var TechnoAguacate 
var TechnoCattanita 
@onready var RatonCorriendoAnim : AnimatedSprite2D = $tutorial_panel/first_to_show/RatonCorriendo
@onready var CattanitaAnim : AnimatedSprite2D = $tutorial_panel/second_to_show/Cattanita
@onready var AguacateAnim : AnimatedSprite2D = $tutorial_panel/second_to_show/Aguacate

@onready var array = [next_button, menu_button, play_button]

var showing_first_block = true
var moving_blocks = false
var moving_blocks_back = false

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
			show_cats()
			menu_button.set_visible(true)
			play_button.set_visible(true)
			play_button.grab_focus()
			TechnoAguacate.visible = true
			TechnoAguacate.collision_layer = 1
			TechnoAguacate.collision_mask = 1
			TechnoCattanita.collision_layer = 1
			TechnoCattanita.collision_mask = 1
			TechnoCattanita.visible = true
			CattanitaAnim.play()
			AguacateAnim.play()

	if 	moving_blocks_back:
		first_block.position[1] += 3
		second_block.position[1] += 3
		if first_block.position[1] >= 0:
			next_button.grab_focus()
			first_block.position[1] = 0
			second_block.position[1] = 210
			moving_blocks_back = false
			showing_first_block = true
			show_again()

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
		TechnoMouse1.queue_free()
		TechnoMouse2.queue_free()

func _on_play_button_pressed():
	start_timer()
	pressed_button = play_button
	func_to_call = "play_funct"


func play_funct():
		menu_button.set_visible(false)
		play_button.set_visible(false)
		next_button.set_visible(true)
		TechnoAguacate.queue_free()
		TechnoCattanita.queue_free()
		moving_blocks_back = true

func _on_timer_timeout():
	pressed_button.button_pressed = false
	for child in array:
		child.focus_mode = Control.FOCUS_ALL
	call(func_to_call)
	
	
func show_again():
	var mouse1 = load("res://Characters/techno_mouse.tscn")	
	var mouse2 = load("res://Characters/techno_mouse.tscn")	
	var mouse1_instance =  mouse1.instantiate() 
	mouse1_instance.position = Vector2(128, 246)
	mouse1_instance.scale = Vector2(4, 4)
	mouse1_instance.name = "Technomouse"
	TechnoMouse1 = mouse1_instance 
	call_deferred("add_child", mouse1_instance)
	var mouse2_instance =  mouse2.instantiate() 
	mouse2_instance.position = Vector2(528, 129)
	mouse2_instance.scale = Vector2(4, 4)
	mouse2_instance.name = "Technomouse2"
	TechnoMouse2 = mouse2_instance 
	call_deferred("add_child", mouse2_instance)
	
func show_cats():
	var aguacate = load("res://Characters/techno_aguacate.tscn")	
	var cattanita = load("res://Characters/techno_cattanita.tscn")	
	var aguacate_instance =  aguacate.instantiate() 
	aguacate_instance.position = Vector2(119, 238)
	aguacate_instance.scale = Vector2(4, 4)
	aguacate_instance.name = "TechnoAguacate"
	TechnoAguacate = aguacate_instance 
	call_deferred("add_child", aguacate_instance)
	var cattanita_instance =  cattanita.instantiate() 
	cattanita_instance.position = Vector2(532, 132)
	cattanita_instance.scale = Vector2(4, 4)
	cattanita_instance.name = "TechnoCattanita"
	TechnoCattanita = cattanita_instance 
	call_deferred("add_child", cattanita_instance)
	
