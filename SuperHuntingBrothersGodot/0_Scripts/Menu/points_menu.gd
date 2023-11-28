extends Control

@export var actual_time_label : Label
@export var record_time_label : Label
@export var points_label : Label

var points
var updated_points
var record
var time
var multiplier
var points_in_level
var steps
var points_per_step
var added_points = false
var can_go_to_next_level = false

# Called when the node enters the scene tree for the first time.
func _ready():
	# Hay que cargar los puntos desde el gestor de datos
	# Hay que cargar el record desde el gestor de datos
	# Hay que cargar el tiempo en el nivel desde el gestor de datos
	# Hay que cargar el multiplicador de puntos del nivel del gestor de datos
	points = 2500
	updated_points = points
	record = 1250
	time = 1500
	multiplier = 3.5
	steps = 50
	set_values_in_labels()
	get_points_obtained_in_level()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if points_in_level > 0:
		if added_points:
			added_points = !added_points
		else:
			points_in_level -= points_per_step
			updated_points += points_per_step
			points_label.text = str(updated_points)
			added_points = !added_points
	else:
		can_go_to_next_level = true
func _on_next_level_button_pressed():
	if can_go_to_next_level:
		print("SE HA PULSADO BOTON SIGUIENTE NIVEL")

func set_values_in_labels():
	points_label.text = str(points)
	actual_time_label.text = str(time)
	record_time_label.text = str(record)

func get_points_obtained_in_level():
	points_in_level = time * multiplier
	points_per_step = points_in_level / steps
