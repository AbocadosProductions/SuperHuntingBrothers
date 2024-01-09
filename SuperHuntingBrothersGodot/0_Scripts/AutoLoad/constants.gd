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
const MAZES_1_POSITION = Vector2 (300, 375)
const MAZES_2_POSITION = Vector2 (715, 375)
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
const TIME_PER_LEVEL_TO_SUSTRACT = 5
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
const MAX_FLEE_TIME = 1.5

# --------------------------------------------------------------------------- #

# Pause Menu constants

const PAUSE_MENU_SIGNAL = "game_paused"

# --------------------------------------------------------------------------- #

# Lose Menu constants

const END_MENU_LEVEL_RECORD_SIGNAL = "new_level_record"
const END_MENU_POINTS_RECORD_SIGNAL = "new_points_record"

# --------------------------------------------------------------------------- #

# Positions constants

const POSITIONS_PER_LEVEL = {
	"maze_1" = {"cat" = [Vector2(13, 9)],
				"mouse" = [Vector2(-150, -155), Vector2(40, 110), Vector2(-54, 12), Vector2(106, 33)]},
	"maze_2" = {"cat" = [Vector2(13, 9)],
				"mouse" = [Vector2(-150, -155), Vector2(40, 110), Vector2(-54, 12), Vector2(106, 33)]},
	"maze_3" = {"cat" = [Vector2(13, 9)],
				"mouse" = [Vector2(-150, -155), Vector2(40, 110), Vector2(-54, 12), Vector2(106, 33)]},
	"maze_4" = {"cat" = [Vector2(13, 9)],
				"mouse" = [Vector2(-150, -155), Vector2(40, 110), Vector2(-54, 12), Vector2(106, 33)]}
				}
# --------------------------------------------------------------------------- #

# Directions constants

const DIRECTIONS = {
	Vector2(1, 0): "_Right", 
	Vector2(0, 1): "_Down", 
	Vector2(-1, 0): "_Left", 
	Vector2(0, -1): "_Up"
}

const CRASH_DIRECTIONS = {
	Vector2(1, 0): [Vector2(0, 1), Vector2(0, -1)], 
	Vector2(0, 1): [Vector2(1, 0), Vector2(-1, 0)], 
	Vector2(-1, 0): [Vector2(0, 1), Vector2(0, -1)], 
	Vector2(0, -1): [Vector2(-1, 0), Vector2(1, 0)]
}

# --------------------------------------------------------------------------- #

# Animation names constants

const ANIMATION_BEGGINING_RIGHT = "Beggining"
const ANIMATION_IDLE = "Idle"
const ANIMATION_IDLE_RIGHT = "Idle_Right"
const ANIMATION_IDLE_LEFT = "Idle_Left"
const ANIMATION_IDLE_UP = "Idle_Up"
const ANIMATION_IDLE_DOWN = "Idle_Down"
const ANIMATION_RUN = "Run"
const ANIMATION_RUN_RIGHT = "Run_Right"
const ANIMATION_RUN_LEFT = "Run_Left"
const ANIMATION_RUN_UP = "Run_Up"
const ANIMATION_RUN_DOWN = "Run_Down"
const ANIMATION_ATTACK = "Attack"
const ANIMATION_ATTACK_RIGHT = "Attack_Right"
const ANIMATION_ATTACK_LEFT = "Attack_Left"
const ANIMATION_ATTACK_UP = "Attack_Up"
const ANIMATION_ATTACK_DOWN = "Attack_Down"
const ANIMATION_RELEASE = "Release"
const ANIMATION_RELEASE_RIGHT = "Release_Right"
const ANIMATION_RELEASE_LEFT = "Release_Left"
const ANIMATION_RELEASE_UP = "Release_Up"
const ANIMATION_RELEASE_DOWN = "Release_Down"

# --------------------------------------------------------------------------- #


# Navigation constants

const MIN_X_CELL_RANGE = -10
const MAX_X_CELL_RANGE = 9
const MIN_Y_CELL_RANGE = -10
const MAX_Y_CELL_RANGE = 9
const CELL_SIZE = 16

# --------------------------------------------------------------------------- #

# Music names constants

const EFFECT_MUSIC = "res://Audios/prueba.wav"
const BACKGROUND_MUSIC = "res://Audios/elevator.wav"
const MUSIC_SIGNALS = [EFFECT_MUSIC]
const EFFECT_SIGNALS = [BACKGROUND_MUSIC]

# --------------------------------------------------------------------------- #

# Countdown constants

const END_COUNTDOWN = "END_COUNTDOWN"
const ANIMATION_COUNTDOWN = "Countdown"

# --------------------------------------------------------------------------- #
