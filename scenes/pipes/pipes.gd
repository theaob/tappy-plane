extends Node2D

func _process(delta):
	position.x -= delta * 120.0

func _on_screen_exited():
	queue_free()

func _on_pipe_body_entered(body: Node2D):
	if body.is_in_group("player"):
		print("Plane Dead:", body)
		body.die()

func _on_laser_body_exited(body):
	if body.is_in_group("player"):
		print("Point scored!")
