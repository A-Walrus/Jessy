extends Area2D

export (Array, NodePath) var show = []
export (String) var scene = ""
export var mode="C"
export var dist = 300

var inside = false

func _input(event):
	if not Globals.justClicked:
		if Input.is_action_just_pressed("click") and inside and close():
			if mode=="C":
				get_tree().change_scene("res://Scenes/"+scene+".tscn")
				if get_node("/root/World/Navigation2D/Jessy")!=null:
					Globals.lastpos = get_node("/root/World/Navigation2D/Jessy").position
			elif mode=="S":
				for a in show:
					get_node(a).show()
			Globals._on_click()


func close():
	var vec = position - get_node("/root/World/Navigation2D/Jessy").position
	return vec.length()<dist

func _on_Clickable_mouse_entered():
	inside=true


func _on_Clickable_mouse_exited():
	inside=false
