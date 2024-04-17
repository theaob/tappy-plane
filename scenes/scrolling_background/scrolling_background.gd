extends ParallaxBackground

func _ready():
	SignalManager.on_plane_died.connect(_on_plane_died)

func _process(delta):
	scroll_offset.x -= delta * GameManager.SCROLL_SPEED

func _on_plane_died():
	set_process(false)
