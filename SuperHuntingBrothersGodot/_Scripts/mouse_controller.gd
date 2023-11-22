extends CharacterBody2D

var move_direction : Vector2
var wander_time : float

const SPEED = 300.0

func _ready():
	randomize_wander()

func _process(delta):
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_wander()

func _physics_process(delta):
	var velocity = move_direction * SPEED
	move_and_slide()


func randomize_wander():
	move_direction = Vector2(randf_range(-100, 100), randf_range(-100, 100)).normalized()
	wander_time = randf_range(1, 2)
	
