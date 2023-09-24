extends CanvasLayer

func update_energy():
	$Control/Energy.value = Global.energy
	if Global.energy <= 0:
		get_tree().call_group("player", "die")
	
func update_enemies_destroyed():
	$Control/Label.text = str(Global.enemies_destroyed)

func _ready():
	update_enemies_destroyed()
	update_energy()
