extends CharacterBody2D

var movementSpeed = 40.0
const endScreen = "res://Screens/end_screen.tscn"

func _ready():
	pass

# Run each physics frame
func _physics_process(delta):
	movement()

# Move our character
func movement():
	# Calculates movement based on user input
	var xMov = Input.get_action_strength("right") - Input.get_action_strength("left")
	var yMov = Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov = Vector2(xMov, yMov)
	
	# Moving the player
	velocity = mov.normalized() * movementSpeed + Vector2(0, Global.gravity)
	move_and_slide()
	
	# Clamping the position to the screen
	if position.x < 0:
		position.x = 0
	if position.x > get_viewport_rect().size.x:
		position.x = get_viewport_rect().size.x
	if position.y > get_viewport_rect().size.y:
		position.y = get_viewport_rect().size.y
	if position.y < 0:
		position.y = 0
	

func death():
	# Update the global variable of the points
	var _level = get_tree().change_scene_to_file(endScreen)

func hi_im_albatross():
	pass
