extends CharacterBody2D

const WALL_NAME = "wall"
const CAT_NAME = "cat"
var mouse_is_fleing : bool = false
signal Collision

@export var scene_manager : Node2D

func _ready():
	scene_manager.External_Signal.connect(scene_manager_signal_detected)

func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	detect_collision(collision_info)

func detect_collision(collision_info):
	if collision_info:
		var collision_name = collision_info.get_collider().get_name()
		if WALL_NAME in collision_name:
			Collision.emit(WALL_NAME)

func _on_area_2d_body_entered(body):
	if CAT_NAME in body.name and not mouse_is_fleing:
		body.mouse_captured()
		Collision.emit(CAT_NAME)

func scene_manager_signal_detected(signal_emited):
	if signal_emited == "mice_captured":
		Collision.emit(signal_emited)
