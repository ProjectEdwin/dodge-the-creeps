extends StaticBody2D


@export var type : String


func _ready() -> void:
	start()


func start():
	position = set_spawn_point()
	type = set_type()
	set_power_up_sprite(type)
	$PowerUpAppearsSound.play()
	show()
	print(
		"PowerUp :: type:" + type + 
		" | position:" + str(position))

func set_power_up_sprite(sprite):
	if sprite == "Tiny":
		var texture = preload("res://art/playerGrey_up1.png") 
		$Sprite2D.texture = texture
	elif sprite == "Ghost":
		var texture = preload("res://art/powerup_ghost.png") 
		$Sprite2D.texture = texture
	elif sprite == "Bomb":
		var texture = preload("res://art/powerup_bomb.png")
		$Sprite2D.texture = texture

func set_spawn_point(): # sets a random spawn point for the PowerUp
	var spawn_point = Vector2(0.0, 0.0)
	var padding = 20.0 # set this larger for more padding for power ups
	spawn_point.x = randf_range(padding, (get_viewport_rect().size.x - padding))
	spawn_point.y = randf_range(padding, (get_viewport_rect().size.y - padding))
	return spawn_point


func set_type():
	var types = ["Tiny", "Bomb", "Ghost"] # TODO: add  "Slow" and "Invincible"
	return types.pick_random()


func _on_power_up_timer_timeout() -> void:
	queue_free()
