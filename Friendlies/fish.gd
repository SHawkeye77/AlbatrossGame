extends CharacterBody2D

const FISH_POINTS = 10

func _physics_process(delta):
	velocity = Vector2(0, Global.gravity)
	move_and_slide()

# Removing the node on timeout
func _on_lifetime_timer_timeout():
	self.queue_free()

func _on_area_2d_body_entered(body):
	# If it is the albatross entering, collect the fish and remove it
	if body.has_method("hi_im_albatross"):
		Global.playerPoints += FISH_POINTS
		self.queue_free()
