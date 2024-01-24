extends Control

@onready var normal_menu : Node2D = $normal_menu
@onready var credits_menu : Node2D = $credits_menu
@onready var timer : Timer = $Timer
@onready var music_manager : Node2D = $music_manager

@onready var cred_button : Button = $normal_menu/Menu/VBoxContainer/credits_button
@onready var play_button : Button = $normal_menu/Menu/VBoxContainer/play_button
@onready var quit_button : Button = $normal_menu/Menu/VBoxContainer/quit_button
@onready var vol_button : Button = $normal_menu/Menu/VBoxContainer/volumen
@onready var vol_panel : Panel = $normal_menu/Menu/VBoxContainer/volumen/Panel_Volumen
var show_vol_panel = false
var move_vol_panel = false
@onready var vol_slider : HSlider = $normal_menu/Menu/VBoxContainer/volumen/Panel_Volumen/volumen_slider

@onready var back_button : Button = $credits_menu/credits_menu_panel/back_to_menu_button
@onready var tutorial_button : Button = $credits_menu/credits_menu_panel/back_to_menu_button

@onready var normal_button : Button = $difficulty_menu/difficulty_menu_panel/HBoxContainer/normal_mode
@onready var normal_panel : Panel = $difficulty_menu/difficulty_menu_panel/normal_panel
var show_normal_record_panel = false
var move_normal_record_panel = false
@onready var hard_button : Button = $difficulty_menu/difficulty_menu_panel/HBoxContainer/hard_mode
@onready var hard_panel : Panel = $difficulty_menu/difficulty_menu_panel/hard_panel
var show_hard_record_panel = false
var move_hard_record_panel = false
@onready var back_difficulty_button : Button = $difficulty_menu/difficulty_menu_panel/back_menu
@onready var start_game_button : Button = $difficulty_menu/difficulty_menu_panel/start_game_button
@onready var difficulty_label : Label = $difficulty_menu/difficulty_menu_panel/difficulty_label

@onready var array = [cred_button, play_button, quit_button, vol_slider, back_button, tutorial_button, 
					  normal_button, hard_button, back_difficulty_button, start_game_button]

var func_to_call 
var pressed_button

@onready var difficulty_menu : Node2D = $difficulty_menu
@onready var data_manager : Node2D = $DataManager
@onready var audio_bus := AudioServer.get_bus_index(Constants.AUDIO_BUS)


func _ready():
	music_manager.play(Constants.MENU_MUSIC)
	for child in array:
		child.focus_mode = Control.FOCUS_ALL

	vol_slider.focus_mode = Control.FOCUS_NONE
	normal_menu.focus()
	start_game_button.focus_mode = Control.FOCUS_NONE
	data_manager.reset_data_from_run()
	
func _process(delta):
	check_if_need_to_move_vol_panel()
	check_if_need_to_normal_record_panel()
	check_if_need_to_hard_record_panel()

func check_if_need_to_move_vol_panel():
	if move_vol_panel:
		if show_vol_panel:
			if vol_panel.position.x < 80:
				vol_panel.position.x += 5
				if vol_panel.position.x >= 80 :
					vol_panel.position.x = 80
					move_vol_panel = false
		else:
			if vol_panel.position.x > 0:
				vol_panel.position.x -= 5
				if vol_panel.position.x < 0 :
					vol_panel.position.x = 0
					move_vol_panel = false

	if show_vol_panel:
		if Input.is_action_pressed("enter"):
			_on_volumen_slider_focus_exited()
			vol_button.grab_focus()
		
func check_if_need_to_normal_record_panel():
	if move_normal_record_panel:
		if show_normal_record_panel:
			if normal_panel.position.x > -65:
				normal_panel.position.x += -5
				if normal_panel.position.x <= -65:
					normal_panel.position.x = -65
					move_normal_record_panel = false
		else:
			if normal_panel.position.x < 0:
				normal_panel.position.x += 5
				if normal_panel.position.x >= 0 :
					normal_panel.position.x = 0
					move_normal_record_panel = false
					
func check_if_need_to_hard_record_panel():
	if move_hard_record_panel:
		if show_hard_record_panel:
			if hard_panel.position.x < 163:
				hard_panel.position.x += +5
				if hard_panel.position.x >= 163:
					hard_panel.position.x = 163
					move_hard_record_panel = false
		else:
			if hard_panel.position.x > 98:
				hard_panel.position.x -= 5
				if hard_panel.position.x <= 98 :
					hard_panel.position.x = 98
					move_hard_record_panel = false

func _on_play_button_pressed():
	music_manager.play(Constants.BUTTON_PRESSED_EFFECT)
	start_timer()
	pressed_button = play_button
	func_to_call = "play_funct"

func _on_volumen_slider_value_changed(_value):
	var value = - Constants.MINIMUM_DB_VALUE + Constants.MINIMUM_DB_VALUE * _value * 0.01
	if value < - Constants.MINIMUM_DB_VALUE * 0.95 :
		value = -80
	AudioServer.set_bus_volume_db(audio_bus, value)

func _on_credits_button_pressed():
	music_manager.play(Constants.BUTTON_PRESSED_EFFECT)
	start_timer()
	pressed_button = cred_button
	func_to_call = "credits_funct"

func _on_quit_button_pressed():
	music_manager.play(Constants.BUTTON_PRESSED_EFFECT)
	start_timer()
	pressed_button = quit_button
	func_to_call = "quit_funct"

func _on_back_to_menu_button_pressed():
	music_manager.play(Constants.COUNTDOWN_EFFECT)
	start_timer()
	pressed_button = back_button
	func_to_call = "back_funct"


func start_timer():
	timer.start()
	for child in array:
		child.focus_mode = Control.FOCUS_NONE

func _on_timer_timeout():
	pressed_button.button_pressed = false
	for child in array:
		child.focus_mode = Control.FOCUS_ALL
	call(func_to_call)
	
func credits_funct():
	normal_menu.set_visible(false)
	credits_menu.set_visible(true)
	credits_menu.focus()

func play_funct():
	normal_menu.set_visible(false)
	difficulty_menu.set_visible(true)
	start_game_button.focus_mode = Control.FOCUS_NONE
	difficulty_menu.focus()
	
func quit_funct():
	get_tree().quit()
	
func back_funct():
	normal_menu.set_visible(true)
	credits_menu.set_visible(false)
	normal_menu.focus()

func _on_normal_mode_pressed():
	music_manager.play(Constants.BUTTON_PRESSED_EFFECT)
	start_timer()
	pressed_button = normal_button
	func_to_call = "normal_funct"

func _on_hard_mode_pressed():
	music_manager.play(Constants.BUTTON_PRESSED_EFFECT)
	start_timer()
	pressed_button = hard_button
	func_to_call = "hard_funct"

func _on_back_menu_pressed():
	music_manager.play(Constants.BUTTON_PRESSED_EFFECT)
	start_timer()
	pressed_button = back_difficulty_button
	func_to_call = "back_menu_funct"


func _on_tutorial_pressed():
	music_manager.play(Constants.BUTTON_PRESSED_EFFECT)
	start_timer()
	pressed_button = tutorial_button
	func_to_call = "tutorial_funct"

func tutorial_funct():
	get_tree().change_scene_to_file(Constants.TUTORIAL_MENU)

func normal_funct():
	data_manager.set_difficulty(Constants.NORMAL_MODE)
	start_game_button.disabled = false
	difficulty_label.text = Constants.DIFFICULTY_TEXTS[Constants.NORMAL_MODE]
	difficulty_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	for child in array:
		child.focus_mode = Control.FOCUS_ALL
	normal_button.grab_focus()
	move_normal_record_panel = true
	show_normal_record_panel = true
	move_hard_record_panel = true
	show_hard_record_panel = false

func hard_funct():
	data_manager.set_difficulty(Constants.HARD_MODE)
	start_game_button.disabled = false
	difficulty_label.text = Constants.DIFFICULTY_TEXTS[Constants.HARD_MODE]
	difficulty_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	for child in array:
		child.focus_mode = Control.FOCUS_ALL
	hard_button.grab_focus()
	move_normal_record_panel = true
	show_normal_record_panel = false
	move_hard_record_panel = true
	show_hard_record_panel = true

func back_menu_funct():
	data_manager.set_difficulty("")
	difficulty_label.text = Constants.DEFAULT_TEXT
	difficulty_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	start_game_button.disabled = true
	start_game_button.focus_mode = Control.FOCUS_NONE
	normal_menu.set_visible(true)
	difficulty_menu.set_visible(false)
	normal_menu.focus()
	move_normal_record_panel = true
	show_normal_record_panel = false
	move_hard_record_panel = true
	show_hard_record_panel = false

func _on_start_game_button_pressed():
	music_manager.play(Constants.BUTTON_PRESSED_EFFECT)
	start_timer()
	pressed_button = start_game_button
	func_to_call = "start_game_funct"
	
func start_game_funct():
	get_tree().change_scene_to_file(Constants.FIRST_LEVEL)


func _on_volumen_pressed():
	music_manager.play(Constants.BUTTON_PRESSED_EFFECT)
	start_timer()
	pressed_button = vol_button
	func_to_call = "vol_funct"

func vol_funct():
	move_vol_panel = true
	show_vol_panel = true
	vol_slider.focus_mode = Control.FOCUS_ALL
	vol_slider.grab_focus()

func _on_volumen_slider_focus_exited():
	show_vol_panel = false
	move_vol_panel = true
	vol_slider.focus_mode = Control.FOCUS_NONE

func _focus_entered():
	music_manager.play(Constants.BUTTON_FOCUS_EFFECT)
