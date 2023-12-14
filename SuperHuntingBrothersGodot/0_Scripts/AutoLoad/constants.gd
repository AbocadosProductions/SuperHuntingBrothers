# Level constants

const FIRST_LEVEL: String = "res://Scenes/core.tscn"
const MAIN_MENU: String = "res://Scenes/main_menu.tscn"
const LOSE_MENU: String = "res://Scenes/lose_menu.tscn"

# --------------------------------------------------------------------------- #

# Save System constants

const SAVE_PATH: String = "res://save_data.tres"

# --------------------------------------------------------------------------- #

# LevelManager constants

const MAZES_FOLDER_PATH = "res://Scenes/Mazes"
const MAZES_1_POSITION = Vector2 (0, 0)
const MAZES_2_POSITION = Vector2 (1500, 0)
const MAZE_FILE_TERMINATION = ".tscn"
const MAZE_FILE_PREFIX = "maze"
const MAZE_PATH_FORMAT_STRING = "/%s.tscn"

# --------------------------------------------------------------------------- #

# Punctuation Menu constants

const PUNCTUATION_MOVING_STEPS = 50
const PUNCTUATION_INITIAL_TRANSFORM = -3000
const PUNCTUATION_SHOWING_TRANSFORM = 0
const PUNCTUATION_FINAL_TRANSFORM = 3000
const PUNCTUATION_UPDATE_STEPS = 50
const PUNCTUATION_MULTIPLIER_PER_LEVEL = 30
const MINUTES_AND_SECONDS_FORMAT_STRING = "%dm  %ds"
const MINUTES_FORMAT_STRING = "%dm"
const SECONDS_FORMAT_STRING = "%ds"
const NEW_RECORD_SIGNAL = "new_record_signal"
const NEW_RECORD_BLINK_RATE = 6

const POINTS_MENU_FINISHED_SIGNAL = "points_menu_finished"

# --------------------------------------------------------------------------- #

# SceneManager constants

const SCENE_MANAGER_NEW_MAZES_PREPARATION_SIGNAL = "new_mazes"
const SCENE_MANAGER_NEW_MAZES_START_SIGNAL = "new_mazes_start"
const SCENE_MANAGER_LEVEL_RUNNING_SIGNAL = "level_running"
const SCENE_MANAGER_ONE_MOUSE_CAPTURED_SIGNAL = "mouse_captured"
const SCENE_MANAGER_MICE_CAPTURED_SIGNAL = "mice_captured"
const SCENE_MANAGER_SHOW_POINTS_SIGNAL = "show_points"
const SCENE_MANAGER_PREPARATION_TIME = 1

# --------------------------------------------------------------------------- #

# TimeManager constants

const TIME_MANAGER_NEW_MAZES_TIMEOUT_SIGNAL = "timeout"
const TIME_MANAGER_TRESHOLD_REACHED_SIGNAL = "treshold_reached"
const DEFAULT_TIME_PER_LEVEL = 60
const TIME_PER_LEVEL_TO_SUSTRACT = 55
const MINIMUM_TIME_PER_LEVEL = 5
const TRESHOLD_TIME = 15

# --------------------------------------------------------------------------- #

# Cat constants

const CAT_MANUAL_CONTROL_SIGNAL = "manual_control"
const CAT_MOUSE_CAPTURED_SIGNAL = "mouse_captured"

# --------------------------------------------------------------------------- #

# Mouse constants

const MOUSE_IDLE_SIGNAL = "idle"
const MOUSE_FLEE_SIGNAL = "flee"
const MOUSE_CAT_DETECTED_SIGNAL = "captured"
const CAT_PREFIX = "cat"
const WALL_PREFIX = "wall"
const MAX_CAPTURE_TIME = 2.0

# --------------------------------------------------------------------------- #

# Lose Menu constants
const END_MENU_LEVEL_RECORD_SIGNAL = "new_level_record"
const END_MENU_POINTS_RECORD_SIGNAL = "new_points_record"
