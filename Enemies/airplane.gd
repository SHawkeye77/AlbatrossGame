extends CharacterBody2D

const AIRPLANE_SPEED = 10.0
const AIRPLANE_HEIGHT = 64  # Also in the airplane spawner script

func _physics_process(delta):#
	# Moving the airplane
	velocity = Vector2(0, Global.gravity + AIRPLANE_SPEED)
	move_and_slide()
	
	# If the airplane is off the screen, destroy it
	if self.position.y > (get_viewport_rect().size.y + AIRPLANE_HEIGHT):
		self.queue_free()

func _on_area_2d_body_entered(body):
	# If it is the albatross entering, the game ends
	if body.has_method("hi_im_albatross"):
		body.death()
