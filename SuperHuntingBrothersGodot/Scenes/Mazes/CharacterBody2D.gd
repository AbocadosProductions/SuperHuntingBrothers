extends CharacterBody2D

'''
const speed = 75.0
const accel = 10.0

@export var navigator : NavigationAgent2D
@export var target : Sprite2D
var actual_target 


func wander():
	var random_x = randi_range(-10, 9)
	var random_y = randi_range(-10, 9)
	actual_target = Vector2((random_x * 16) - 8, (random_y * 16) - 8)
	navigator.target_position = actual_target
	target.position = actual_target

func _ready():
	wander()

func _physics_process(delta):
	var distance = actual_target - global_position 
	
	if distance.length() < 20:
		wander()

	var direction = Vector2 ()
	direction = navigator.get_next_path_position() - global_position
	direction = direction.normalized()
	velocity = velocity.lerp(direction * speed, accel * delta)

	move_and_slide()


'''
