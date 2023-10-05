extends Node2D

# Exclamation
@onready var exclamationScene = preload("res://Enemies/exclamation.tscn")
const exclamationStartingScale = Vector2(0.1, 0.1)
const exclamationEndingScale = Vector2(1.0, 1.0)
var exclamationTransitionTime = 3.0
var exclamationsAtATime = 1

# Lightning
@onready var lightningScene = preload("res://Enemies/lightning.tscn")
const lightningLifetime = 4.0  # Time before the lightning is removes

func _ready():
	pass

func _on_timer_timeout():
	for i in range(0, exclamationsAtATime):
		# Spawn a small exclamation point at random place (just about) on the screen
		var exclamation = exclamationScene.instantiate()
		var xRandom = randf_range(0, get_viewport_rect().size.x)
		var yRandom = randf_range(-64.0, get_viewport_rect().size.y - 64.0)
		exclamation.position = Vector2(xRandom, yRandom)
		exclamation.scale = exclamationStartingScale
		add_child(exclamation)
		
		# Tween the exclamation's size
		var tween = create_tween()
		tween.tween_property(exclamation, "scale", exclamationEndingScale, exclamationTransitionTime).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
		
		# Calling "changeToLightning" when the tween completes
		tween.tween_callback(changeToLightning.bind(exclamation))
	

# Remove the exclamation, spawn a lightning, and set up collisiosn
func changeToLightning(exclamationObj):
	# Collecting data from the exclamation, then removing it
	var xPos = exclamationObj.global_position.x
	var yPos = exclamationObj.global_position.y
	exclamationObj.queue_free()
	
	# Spawning a lightning at the position of the exclamation
	var lightning = lightningScene.instantiate()
	var lightningTimer = lightning.get_node("LifetimeTimer")
	lightningTimer.wait_time = lightningLifetime
	lightning.position = Vector2(xPos, yPos)
	add_child(lightning)
	lightningTimer.start()
	
