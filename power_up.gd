extends StaticBody2D

#TODO: functionality mising
	# spawn within reasonable screen bounds - done
	# despawn power up in 3 seconds - done
	# disappear when entering Player - done
	# create power up spawn algo after 20 points - done
	# play a sound when when collected
	# make the player tiny - done

@export var type : String


func _ready() -> void:
	start()


func start():
	position = set_spawn_point()
	type = set_type()
	$TinySound.play()
	show()
	print(
		"PowerUp :: type:" + type + 
		" | position:" + str(position))


func set_spawn_point(): # sets a random spawn point for the PowerUp
	var spawn_point = Vector2(0.0, 0.0)
	spawn_point.x = randf_range(20.0, (get_viewport_rect().size.x - 20))
	spawn_point.y = randf_range(20.0, (get_viewport_rect().size.y - 20))
	return spawn_point


func set_type():
	var types = ["Tiny"]
	return types.pick_random()


func _on_power_up_timer_timeout() -> void:
	queue_free()
