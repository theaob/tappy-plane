extends Control

@onready var highscore = $MarginContainer/Highscore

func _ready():
	highscore.text = str(ScoreManager.get_high_score())

func _process(_delta):
	if Input.is_action_just_pressed("fly"):
		GameManager.load_game_scene()
