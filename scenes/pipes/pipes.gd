extends Node2D

@onready var score_sound = $ScoreSound

func _ready():
	SignalManager.on_plane_died.connect(_on_plane_died)

func _process(delta):
	position.x -= GameManager.SCROLL_SPEED * delta

func _on_screen_exited():
	queue_free()
	
func _on_plane_died():
	set_process(false)

func _on_pipe_body_entered(body: Node2D):
	if body.is_in_group(GameManager.GROUP_PLAYER):
		if body.has_method("die"):
			body.die()

func _on_laser_body_entered(body):	
	if body.is_in_group(GameManager.GROUP_PLAYER):
		ScoreManager.increment_score()
		score_sound.play()
