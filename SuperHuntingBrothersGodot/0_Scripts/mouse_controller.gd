extends CharacterBody2D

var wander_time : float

var maze_directions = [Vector2(1, 0), Vector2(0, 1), Vector2(-1, 0), Vector2(0, -1)]
var random_direction = null

const WALL_NAME = "wall"
const SPEED = 100.0

func _ready():
	randomize_wander()

func _process(delta):
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_wander()

func _physics_process(delta):
	velocity = random_direction * SPEED
	var collision_info = move_and_collide(velocity * delta)
	detect_collision(collision_info)

func randomize_wander():
	random_direction = maze_directions[randi() % maze_directions.size()]
	wander_time = randf_range(1, 2)
	
func detect_collision(collision_info):
	if collision_info:
		var collision_name = collision_info.get_collider().get_name()
		if WALL_NAME in collision_name:
			randomize_wander()
