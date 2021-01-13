extends Node2D



func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		get_tree().change_scene("res://Scenes/Shower.tscn")
