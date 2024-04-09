extends CharacterBody2D

const GRAVITY: float = 1500.0
const POWER: float = -500.0

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer

func _physics_process(delta):
	fly(delta)
	move_and_slide()
	
	if is_on_floor() || is_on_ceiling():
		die()

func fly(delta) -> void:
	velocity.y += GRAVITY * delta
	
	if (Input.is_action_just_pressed("fly")):
		velocity.y = POWER 
		animation_player.play("power")
		
func die() -> void:
	print("DEAD")

	set_physics_process(false)
	animated_sprite_2d.stop()
