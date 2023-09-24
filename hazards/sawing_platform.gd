extends StaticBody2D

var player_damage = 1

var damaging_player = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if damaging_player:
		Global.energy -= player_damage
		get_tree().call_group("gui", "update_energy")

func _on_player_detector_body_entered(body):
	damaging_player = true

func _on_player_detector_body_exited(body):
	damaging_player = false
