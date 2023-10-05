extends Node2D

# Airplanes
@onready var fishScene = preload("res://Enemies/airplane.tscn")
@onready var airplaneSpawnFrequencyTimer = get_node("%AirplaneSpawnFrequencyTimer")
const AIRPLANE_HEIGHT = 64  # Also in the airplane script
var airplaneSpawnFrequency = 5.0

func _ready():
	airplaneSpawnFrequencyTimer.wait_time = airplaneSpawnFrequency
	airplaneSpawnFrequencyTimer.start()

func _on_airplane_spawn_frequency_timer_timeout():
	# Spawn an airplane at a random place just above the screen
	var airplane = fishScene.instantiate()
	var xRandom = randf_range(0, get_viewport_rect().size.x)
	airplane.position = Vector2(xRandom, -1.0 * AIRPLANE_HEIGHT)
	add_child(airplane)
