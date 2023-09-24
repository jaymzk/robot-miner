extends Area2D

@export var life_added = 10

func _on_body_entered(body):
	Global.energy += life_added
	get_tree().call_group("gui", "update_energy")
	queue_free()
