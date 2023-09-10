extends StaticBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_player_detector_body_entered(body):
	print("damaging player")



func _on_player_detector_body_exited(body):
	print("no longer damaging player")
