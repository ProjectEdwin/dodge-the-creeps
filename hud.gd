extends CanvasLayer

# Notifies `Main` node that the button has been pressed
signal start_game


func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()


func show_game_over(message):
	show_message(message)
	# Wait until the MessageTimer has counted down.
	await $MessageTimer.timeout

	$Message.text = "Dodge the Creeps!"
	$Message.show()
	$VersionLabel.show()
	$AuthorLabel.show()
	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()


func update_score(score):
	$ScoreLabel.text = str(score)

	
func update_hi_score(high_score):
	$HiScoreLabel.text = "Best: " + str(high_score)


func _on_start_button_pressed() -> void:
	$StartButton.hide()
	$VersionLabel.hide()
	$AuthorLabel.hide()
	start_game.emit()


func _on_message_timer_timeout() -> void:
	$Message.hide()
