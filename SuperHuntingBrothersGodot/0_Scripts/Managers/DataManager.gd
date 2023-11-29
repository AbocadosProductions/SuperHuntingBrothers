extends Node2D

var _save_data : SaveSystem

func _ready():
	_create_or_load_save_data()

# Loads the last sava_data file or creates it if there isn't any
func _create_or_load_save_data():
	if SaveSystem.save_exists():
		_save_data = SaveSystem.load_savedata()
	else:
		_save_data = SaveSystem.new()
		_save_data.write_savedata()

# Gets the last record of the index level if there was to show it in the punctuation screen
func return_record_data(level: int) -> int:
	var record = 0
	if level < len(_save_data.records_per_level):
		record = _save_data.records_per_level[level]
	return record

# Appends points of the level to the list
func set_level_points(points: int):
	_save_data.points_per_level.append(points)
	_save_game()
	
func set_new_record_points():
	# Set variables for more clarity
	var actual_level_index = max(len(_save_data.points_per_level) - 1, 0)
	var actual_level_points = _save_data.points_per_level[-1]
	# Stores in the record the actual level points
	# If record already existed will override, otherwise will append it to the list
	if actual_level_index < len(_save_data.records_per_level):
		_save_data.records_per_level[actual_level_index] = actual_level_points
	else:
		_save_data.records_per_level.append(actual_level_points) 
	_save_game()
	
# Resets the points array 
func _reset_level_points():
	_save_data.points_per_level = []
	_save_game()

func _save_game():
	_save_data.write_savedata()
