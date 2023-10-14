extends StaticBody2D

func _on_player_detector_body_entered(body):
	$AnimationPlayer.play("open")
	
func reset_game():
	Global.energy = 70
	Global.enemies_destroyed =  0
	get_tree().change_scene_to_file("res://GUI/you_made_it.tscn")
	
	
	
