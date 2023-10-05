extends CharacterBody2D

func _physics_process(delta):
	velocity = Vector2(0, Global.gravity)
	move_and_slide()

# Removing the node on timeout
func _on_lifetime_timer_timeout():
	self.queue_free()

func _on_area_2d_body_entered(body):
	# If it is the albatross entering, the game ends
	if body.has_method("hi_im_albatross"):
		body.death()
