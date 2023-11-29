extends Resource
class_name SaveSystem

const path = Constants.SAVE_PATH

@export var records_per_level : Array
@export var points_per_level : Array 

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
