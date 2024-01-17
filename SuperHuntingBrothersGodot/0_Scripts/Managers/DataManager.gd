extends Node2D

var _save_data : SaveSystem

func _init():
	_create_or_load_save_data()

# Loads the last save_data file or creates it if there isn't any
func _create_or_load_save_data() -> void:
	if SaveSystem.save_exists():
		_save_data = SaveSystem.load_savedata()
	else:
		_save_data = SaveSystem.new()
		_save_data.write_savedata()

# RECORD TIMES SECTIONS : SET, RETURN,

func set_new_record_time() -> void:
	var actual_level_index = max(len(_save_data.times_per_level) - 1, 0)
	var actual_level_time = _save_data.times_per_level[-1]
	if actual_level_index < len(_save_data.record_times_per_level[_save_data.difficulty]):
		_save_data.record_times_per_level[_save_data.difficulty][actual_level_index] = actual_level_time
	else:
		_save_data.record_times_per_level[_save_data.difficulty].append(actual_level_time)
	_save_game()

func return_record_time() -> int:
	var actual_level_index = max(len(_save_data.times_per_level) - 1, 0)
	var record = 0

	if actual_level_index < len(_save_data.record_times_per_level[_save_data.difficulty]) - 1:
		record = _save_data.record_times_per_level[_save_data.difficulty][actual_level_index]

	return record

# RECORD POINTS SECTIONS : SET, RETURN,

func set_new_record_points() -> void:
	print(_save_data.actual_punctuation)
	_save_data.record_punctuation[_save_data.difficulty] = _save_data.actual_punctuation
	_save_game()

func return_record_points() -> int:
	return _save_data.record_punctuation[_save_data.difficulty]

func return_record_points_normal() -> int:
	return _save_data.record_punctuation[Constants.NORMAL_MODE]

func return_record_points_hard() -> int:
	return _save_data.record_punctuation[Constants.HARD_MODE]

# RECORD LEVEL INDEX SECTIONS : SET, RETURN,

func set_new_record_level_index() -> void:
	_save_data.record_level[_save_data.difficulty] = len(_save_data.times_per_level)
	_save_game()

func return_record_level_index() -> int:
	return _save_data.record_level[_save_data.difficulty]
	
func return_record_level_index_normal() -> int:
	return _save_data.record_level[Constants.NORMAL_MODE]
	
func return_record_level_index_hard() -> int:
	return _save_data.record_level[Constants.HARD_MODE]

# ACTUAL TIMES SECTIONS : ADD, RETURN, RESET

func add_actual_level_time(time: int) -> void:
	_save_data.times_per_level.append(time)
	_save_game()

func return_last_level_time() -> int:
	var points = 0

	if _save_data.times_per_level != []:
		points = _save_data.times_per_level[-1] 

	return points

func _reset_level_points():
	_save_data.times_per_level = []
	_save_game()


# POINTS SECTIONS : SET, RETURN, RESET

func set_points(points : int) -> void:
	_save_data.actual_punctuation = points
	_save_game()
	
func return_points() -> int:
	return _save_data.actual_punctuation

func reset_points() -> void:
	_save_data.actual_punctuation = 0
	_save_game()

# UTILS SECTION

func return_level_index() -> int:
	return len(_save_data.times_per_level)

func _save_game() -> void:
	_save_data.write_savedata()
	
func reset_data_from_run() -> void:
	_save_data.times_per_level = []
	_save_data.actual_punctuation = 0
	_save_data.difficulty = ""
	_save_game()
	
# DIFICULTY SECTION

func get_difficulty() -> String:
	return _save_data.difficulty

func set_difficulty(difficulty : String) -> void:
	_save_data.difficulty = difficulty
	_save_data.write_savedata()

