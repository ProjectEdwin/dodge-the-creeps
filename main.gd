extends Node
## Main Game Logic
## Adapted from Dodge the Creeps Godot tutorial

@export var mob_scene: PackedScene

var score
var hi_score = 0


func _ready():
	$Player.hide()
	$HUD.update_hi_score(hi_score)


func new_game():
	score = 0 #TODO: Dont forget to set this to 0 
	$Player.start($StartPosition.position)
	$MobTimer.wait_time = 2.0
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	get_tree().call_group("mobs", "queue_free")
	$Music.play()


func mob_accelerator():
	var multiplier = score * 2
	return Vector2(randf_range(100.0 + multiplier, 150.0 + multiplier), 0.0)

	
func set_mob_frequency():
	#decrease the MobTimer every 5 points
	if score % 5 == 0:
		$MobTimer.wait_time -= 0.1


func mob_sizer():
	var sizes = ["S", "M", "L", "XL"]
	if score < 50:
		return "M"
		
	elif score < 70:
		return sizes[randi() % 2]
	
	elif score < 100:
		return sizes[randi() % 3]
		
	else:
		return sizes[randi() % 4]


func _on_mob_timer_timeout():
	create_mob()


func create_mob():
	
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
	var velocity = mob_accelerator()
	mob.linear_velocity = velocity.rotated(direction)
	
	#set the size of the mob
	var mob_size = mob_sizer()
	mob.set_mob_size(mob_size)
	
	#set the mob sound based on size
	var mob_pitch = {"S":3.0, "M":2.0, "L":1.0, "XL":0.5}
	$MobSound.pitch_scale = mob_pitch[mob_size]
	
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
