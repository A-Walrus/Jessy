extends Node

var nameCall=""

var random = true

var justClicked = false

func _on_click():
	justClicked=true
	$Timer.start()

func _on_Timer_timeout():
	justClicked=false
