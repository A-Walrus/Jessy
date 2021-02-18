extends Node


func _input(event):
	if event.is_action_released("click"):
		get_tree().change_scene("res://Scenes/World.tscn")
