extends CharacterBody2D

func _physics_process(delta):
	velocity = Vector2(0, Global.gravity)
	move_and_slide()
