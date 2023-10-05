extends Node2D

# Fish
@onready var fishScene = preload("res://Friendlies/fish.tscn")
@onready var fishSpawnLengthTimer = get_node("%FishSpawnLengthTimer")
const fishSpawnLength = 5.0
var currentFish = null

func _ready():
	fishSpawnLengthTimer.wait_time = fishSpawnLength
	fishSpawnLengthTimer.start()

func _on_timer_timeout():
	# Remove the previous fish from the scene
	if currentFish != null:
		currentFish.queue_free()

	# Spawn a fish at a random place on the screen
	currentFish = fishScene.instantiate()
	var xRandom = randf_range(0, get_viewport_rect().size.x)
	var yRandom = randf_range(0, get_viewport_rect().size.y)
	currentFish.position = Vector2(xRandom, yRandom)
	add_child(currentFish)
