extends Area2D

signal hit
signal power_up_taken
var PowerSETiny = preload("res://sound/tiny.wav")
var PowerSEReset = preload("res://sound/reset.wav") 

#TODO: Change to be dynamically load sounds as ENUMS?


@export var speed = 200 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		# See the note below about the following boolean assignment.
		$AnimatedSprite2D.flip_h = velocity.x < 0
	
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.flip_v = velocity.y > 0


func _on_body_entered(_body):
	if _body.collision_layer == 2:
		hide() # Player disappears after being hit.
		hit.emit()
		# Must be deferred as we can't change physics properties on a physics callback.
		$CollisionShape2D.set_deferred("disabled", true)

	elif _body.collision_layer == 4:
		power_up_taken.emit()
		var type = _body.type
		power_up_mode(type)
		print("!!" + type + " power up mode activated!!")


func power_up_mode(mode):
	if mode == "Tiny":
		$AnimatedSprite2D.scale = Vector2(0.25, 0.25)
		$CollisionShape2D.scale = Vector2(0.25, 0.25)
		speed = 350
		
		$PlayerSound.stream = PowerSETiny
		$PlayerSound.play()


func reset_power_up():
		$AnimatedSprite2D.scale = Vector2(0.5, 0.5)
		$CollisionShape2D.scale = Vector2(0.5, 0.5)
		speed = 200
		$PlayerSound.stream = PowerSEReset
		$PlayerSound.play()

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
