extends CharacterBody2D

signal Collision


func _physics_process(delta):
	move_and_slide()

func mouse_captured():
	Collision.emit("mouse")
