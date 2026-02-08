extends Node
## Main Game Logic
## Adapted from Dodge the Creeps Godot tutorial

@export var mob_scene: PackedScene

var score
var hi_score = 0
var velocity


func _ready():
	$Player.hide()
	$HUD.update_hi_score(hi_score)


func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$MobTimer.wait_time = 2.0
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	get_tree().call_group("mobs", "queue_free")
	$Music.play()


func set_mob_velocity():
	var multiplier = score * 2
	velocity = Vector2(randf_range(100.0 + multiplier, 150.0 + multiplier), 0.0)
	print(velocity)

	
func set_mob_frequency():
	#decrease the MobTimer every 5 points
	if score % 5 == 0:
		$MobTimer.wait_time -= 0.1
	print($MobTimer.wait_time)


func _on_mob_timer_timeout():
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate()

	# Choose a random location on Path2D.
	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.progress_ratio = randf()

	# Set the mob's position to the random location.
	mob.position = mob_spawn_location.position

	# Set the mob's direction perpendicular to the path direction.
	var direction = mob_spawn_location.rotation + PI / 2

	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction

	# Choose the velocity for the mob.
	set_mob_velocity()
	mob.linear_velocity = velocity.rotated(direction)

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)
	$MobSound.play()


func _on_score_timer_timeout():
	score += 1
	$HUD.update_score(score)
	set_mob_frequency()


func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()


func game_over() -> void:
	$ScoreTimer.stop()
	$MobTimer.stop()
	$Music.stop()
	
	if score > hi_score:
		hi_score = score
		$HUD.update_hi_score(hi_score)
		$HiScoreSound.play()
		$HUD.show_game_over("New Hi Score!")
	else:
		$HUD.show_game_over("Game Over")
		$DeathSound.play()
