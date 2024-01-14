extends Resource
class_name SaveSystem

const path = Constants.SAVE_PATH

@export var record_times_per_level = {
	Constants.HARD_MODE : [],
	Constants.NORMAL_MODE : []
}
@export var times_per_level : Array
@export var actual_punctuation : int
@export var record_punctuation = {
	Constants.HARD_MODE : 0,
	Constants.NORMAL_MODE : 0
}
@export var record_level = {
	Constants.HARD_MODE : 0,
	Constants.NORMAL_MODE : 0
}
@export var difficulty : String

# This function will save the resource save_system in the given path.
func write_savedata() -> void:
	ResourceSaver.save(self, path)

# This function will return saved data or null if it doesnt exist.
static func load_savedata() -> Resource:
	var data = null
	if ResourceLoader.exists(path):
		data = ResourceLoader.load(path)
	return data

static func save_exists() -> bool:
	return ResourceLoader.exists(path)
