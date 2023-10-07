extends StaticBody2D

func _on_player_detector_body_entered(body):
	$AnimationPlayer.play("open")
	
func reset_game():
	get_tree().call_group("player", "reset_game")
	
	
	
