extends CharacterBody2D

const SPEED = 100.0

var move_direction : Vector2
var wander_time : float
var direction = ""

var maze_directions = [Vector2(1, 0), Vector2(0, 1), Vector2(-1, 0), Vector2(0, -1)]
var random_direction = null

signal External_Signal

func randomize_wander():
	random_direction = maze_directions[randi() % maze_directions.size()]
	direction = Constants.DIRECTIONS[random_direction]
	External_Signal.emit(Constants.ANIMATION_RUN)
	wander_time = randf_range(1, 2)
	
func _ready():
	randomize_wander()

func _process(delta):
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_wander()

func _physics_process(delta):
	velocity = random_direction * SPEED
	var collision = move_and_collide(velocity * delta)
	if collision:
			var collision_name = collision.get_collider().get_name()
			if Constants.WALL_PREFIX in collision_name:
				randomize_wander()

