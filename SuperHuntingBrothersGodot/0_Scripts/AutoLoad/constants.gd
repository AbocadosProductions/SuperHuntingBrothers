# Level constants

const FIRST_LEVEL: String = "res://Scenes/core.tscn"
const MAIN_MENU: String = "res://Scenes/main_menu.tscn"
const LOSE_MENU: String = "res://Scenes/lose_menu.tscn"
const TUTORIAL_MENU: String = "res://Scenes/animated_tutorial.tscn"

# --------------------------------------------------------------------------- #

# Save System constants

const SAVE_PATH: String = "res://save_data.tres"

# --------------------------------------------------------------------------- #

# LevelManager constants

const HARD_MODE = "Hard"
const NORMAL_MODE = "Normal"

const MAZES_FOLDER_PATH = "res://Scenes/Mazes"


const MAZES_1_POSITION = Vector2 (344, 397)
const MAZES_2_POSITION = Vector2 (672, 397)
const MAZE_FILE_TERMINATION = ".tscn"
const MAZE_FILE_PREFIX = "maze"
const MAZE_PATH_FORMAT_STRING = "/%s.tscn"

# --------------------------------------------------------------------------- #

# Punctuation Menu constants

const PUNCTUATION_MOVING_STEPS = 50
const PUNCTUATION_INITIAL_TRANSFORM = -3000
const PUNCTUATION_SHOWING_TRANSFORM = 165
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
const SCENE_MANAGER_TIME_OUT_TIME = 3

# --------------------------------------------------------------------------- #

# TimeManager constants

const TIME_MANAGER_NEW_MAZES_TIMEOUT_SIGNAL = "timeout"
const TIME_MANAGER_TRESHOLD_REACHED_SIGNAL = "treshold_reached"

const DEFAULT_TIME_PER_LEVEL = {
	HARD_MODE : 50,
	NORMAL_MODE : 60
} 
const TIME_PER_LEVEL_TO_SUSTRACT = {
	HARD_MODE : 5,
	NORMAL_MODE : 3
}
const MINIMUM_TIME_PER_LEVEL = {
	HARD_MODE : 10,
	NORMAL_MODE : 10
}
const TRESHOLD_TIME = 15
const TIME_MANAGER_IDLE_ANIMATION = "Idle"
const TIME_MANAGER_THRESHOLD_ANIMATION = "Last_Seconds"
const TIME_MANAGER_TIME_OUT_ANIMATION = "Time_Out"

# --------------------------------------------------------------------------- #

# Cat constants

const CAT_MANUAL_CONTROL_SIGNAL = "manual_control"
const CAT_MOUSE_CAPTURED_SIGNAL = "mouse_captured"

# --------------------------------------------------------------------------- #

# Mouse constants

const MOUSE_IDLE_SIGNAL = "idle"
const MOUSE_BEGINING_SIGNAL = "begining"
const MOUSE_FLEE_SIGNAL = "flee"
const MOUSE_CAT_DETECTED_SIGNAL = "captured"
const CAT_PREFIX = "cat"
const WALL_PREFIX = "wall"
const MAX_CAPTURE_TIME = {
	HARD_MODE : 2,
	NORMAL_MODE : 3
	}
const MAX_BEGINING_TIME = 2.0
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
	"maze_1" = { "cat" = [Vector2(8, -9)],
				"mouse" = [Vector2(-119, -86)]},
	"maze_2" = { "cat" = [Vector2(8, -9)],
				"mouse" = [Vector2(-119, -86)]},
	"maze_3" = { "cat" = [Vector2(8, -9)],
				"mouse" = [Vector2(-119, -86)]},
	"maze_4" = { "cat" = [Vector2(8, -9)],
				"mouse" = [Vector2(-119, -86)]}
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

const MIN_X_CELL_RANGE = -8
const MAX_X_CELL_RANGE = 8
const MIN_Y_CELL_RANGE = -9
const MAX_Y_CELL_RANGE = 7
const CELL_SIZE = 16

# --------------------------------------------------------------------------- #

# Music controller constants

const MINIMUM_DB_VALUE = 25

const BUTTON_FOCUS_EFFECT = "res://Sounds/Effects/Button_Focus.mp3"
const BUTTON_PRESSED_EFFECT = "res://Sounds/Effects/Button_Pressed.mp3"
const PAUSE_EFFECT = "res://Sounds/Effects/Pause.mp3"
const PLAY_EFFECT = "res://Sounds/Effects/Play.mp3"
const COUNTDOWN_EFFECT = "res://Sounds/Effects/Countdown.mp3"
const NEW_RECORD_EFFECT = "res://Sounds/Effects/New_Record.mp3"
const AUDIO_BUS = "Master"
const BACKGROUND_MUSIC = "res://Audios/elevator.wav"
const MUSIC_SIGNALS = []
const EFFECT_SIGNALS = [BUTTON_FOCUS_EFFECT, BUTTON_PRESSED_EFFECT, PAUSE_EFFECT, PLAY_EFFECT, COUNTDOWN_EFFECT]

# --------------------------------------------------------------------------- #

# Countdown constants

const END_COUNTDOWN = "END_COUNTDOWN"
const ANIMATION_COUNTDOWN = "Countdown"

# --------------------------------------------------------------------------- #

# Difficulty Selector constants

const DEFAULT_TEXT = "Por favor, selecciona una difficultad"
const DIFFICULTY_TEXTS = {
	NORMAL_MODE : "-Tiempo Maximo de Nivel: 90 s\n\n-Reduccion de tiempo por Nivel: 3 s\n\n-Tiempo para capturar los dos ratones: 3 s",
	HARD_MODE : "-Tiempo Maximo de Nivel: 60 s\n\n-Reduccion de tiempo por Nivel: 5 s\n\n-Tiempo para capturar los dos ratones: 2 s"
}
# --------------------------------------------------------------------------- #
