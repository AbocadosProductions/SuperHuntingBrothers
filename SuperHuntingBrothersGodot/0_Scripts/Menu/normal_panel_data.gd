extends Panel

@onready var max_lv_data : Label = $max_lv_data
@onready var max_punctuation_data : Label = $max_punctuation_data

@export var data_manager : Node2D 

# Called when the node enters the scene tree for the first time.
func _ready():
	
	max_lv_data.text = str(data_manager.return_record_points_normal())
	max_punctuation_data.text = str(data_manager.return_record_level_index_normal())
