extends Control

@onready var score = $MarginContainer/Score

func _ready():
	SignalManager.on_score_updated.connect(_on_score_updated)
	
func _on_score_updated():
	score.text = str(ScoreManager.get_score())
