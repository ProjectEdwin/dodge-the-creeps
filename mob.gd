extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	pass

func set_mob_size(size):
	if size == "S":
		$AnimatedSprite2D.scale = Vector2(0.25, 0.25)
		$CollisionShape2D.scale = Vector2(0.4, 0.4)

	elif size == "M":
		$AnimatedSprite2D.scale = Vector2(0.5, 0.5)
		$CollisionShape2D.scale = Vector2(1.0, 1.0)

	elif size == "L":
		$AnimatedSprite2D.scale = Vector2(1.0, 1.0)
		$CollisionShape2D.scale = Vector2(1.6, 1.6)

	else:
		$AnimatedSprite2D.scale = Vector2(1.75, 1.75)
		$CollisionShape2D.scale = Vector2(2.5, 2.5)

	var mob_types = Array($AnimatedSprite2D.sprite_frames.get_animation_names())
	$AnimatedSprite2D.animation = mob_types.pick_random()
	$AnimatedSprite2D.play()

func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()
