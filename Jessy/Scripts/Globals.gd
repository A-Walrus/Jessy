extends Node

var nameCall=""

var random = ""

var justClicked = false

var dragging = ""

var outfit = 0

signal outfit

var lastpos = Vector2(-238.375,-264.037)

func _on_click():
	justClicked=true
	$Timer.start()

func _on_Timer_timeout():
	justClicked=false

func _input(event):
	if Input.is_action_just_pressed("escape"):
		get_tree().change_scene("res://Scenes/World.tscn")


func outfit(val):
	outfit= (outfit + val) % 3
	emit_signal("outfit")
	
	
