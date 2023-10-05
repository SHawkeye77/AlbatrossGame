extends Node2D

const pointsPerSecond = 1
const DIFFICULTY_INCREASE_PERIOD = 10.0  # Amount of time before the difficulty increases
var time = 0  # Time in seconds
var timeFormatted = ""
@onready var lblTimer = get_node("%lblTimer")
@onready var lblScore = get_node("%lblScore")
@onready var difficultyIncreaseTimer = get_node("%DifficultyIncreaseTimer")
@onready var albatross = get_node("%Albatross")
@onready var lightningSpawner = get_node("%LightningSpawner")
@onready var airplaneSpawner = get_node("%AirplaneSpawner")

func _ready():
	difficultyIncreaseTimer.wait_time = DIFFICULTY_INCREASE_PERIOD
	difficultyIncreaseTimer.start()
	
	# Resetting all the things we change during the game
	Global.gravity = 9.8
	albatross.movementSpeed = 40.0
	lightningSpawner.exclamationTransitionTime = 3.0
	lightningSpawner.exclamationsAtATime = 1
	airplaneSpawner.airplaneSpawnFrequency = 5.0

func _physics_process(delta):
	updateGUI()

func _on_clock_timer_timeout():
	# Updating the score
	Global.playerPoints += pointsPerSecond
	updateGUI()
	
	# Updating the time
	time += 1
	var mins = int(time/60.0)
	var secs = time % 60
	# Ensuring there's always leading zeros
	if mins < 10:
		mins = str(0,mins)
	if secs < 10:
		secs = str(0,secs)
	timeFormatted = str(mins, ":", secs)

func updateGUI():
	lblScore.text = str(Global.playerPoints)
	lblTimer.text = timeFormatted

# Increases the difficulty of the game
func _on_difficulty_increase_timer_timeout():
	# Gravity
	Global.gravity *= 1.25
	albatross.movementSpeed *= 1.25
	
	# Lightning bolts
	lightningSpawner.exclamationTransitionTime *= 0.75
	lightningSpawner.exclamationsAtATime += 1
	
	# Ariplanes
	airplaneSpawner.airplaneSpawnFrequency *= 0.75
