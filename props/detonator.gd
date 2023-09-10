extends StaticBody2D

func _on_player_detector_body_entered(body):
	$AnimationPlayer.play("detonate")
	$PlayerDetector.queue_free()
	get_tree().call_group("explodables","explode")
	get_tree().call_group("camera","shake")
	
	
	
	
