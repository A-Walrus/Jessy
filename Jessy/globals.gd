extends Node

var nameCall=""

var random = true

var justClicked

func _input(event):
	if Input.is_action_just_pressed("click"):
		$Timer.start()
		justClicked=true

func _on_Timer_timeout():
	justClicked=false
