extends Area2D

export (Array, NodePath) var show = []
export (String) var scene = ""
export var mode="C"


var inside = false

func _input(event):
	if not Globals.justClicked:
		if Input.is_action_just_pressed("click") and inside:
			if mode=="C":
				get_tree().change_scene("res://Scenes/"+scene+".tscn")
			elif mode=="S":
				for a in show:
					get_node(a).show()
			Globals._on_click()
	
func _on_Clickable_mouse_entered():
	inside=true


func _on_Clickable_mouse_exited():
	inside=false
