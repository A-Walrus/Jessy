extends Node

var nameCall=""

var random = true

var justClicked = false

func _on_click():
	justClicked=true
	$Timer.start()

func _on_Timer_timeout():
	justClicked=false

func _input(event):
	if Input.is_action_just_pressed("escape"):
		get_tree().change_scene("res://Scenes/World.tscn")
