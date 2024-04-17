extends Control

@onready var space_label = $SpaceLabel
@onready var go_label = $GOLabel
@onready var timer = $Timer
@onready var game_over_sound = $GameOverSound

func _ready():
	hide()
	SignalManager.on_plane_died.connect(_on_plane_died)
	
func _process(_delta):
	if space_label.visible:
		if Input.is_action_just_pressed("fly"):
			GameManager.load_main_scene()

func _on_plane_died():
	show()
	game_over_sound.play()
	timer.start()

func _on_timer_timeout():
	go_label.hide()
	space_label.show()
