extends "res://GUI/ui_template.gd"

func _on_button_play_pressed():
	get_tree().change_scene_to_file("res://levels/level_1.tscn")
