extends Area2D

export (Array, NodePath) var show = []
export (String) var scene = ""
export var mode="C"
export var dist = 300

var inside = false

signal press

func _input(event):
	if not Globals.justClicked:
		if Input.is_action_just_pressed("click") and inside and close():
			if mode=="C":
				get_tree().change_scene("res://Scenes/"+scene+".tscn")
				if scene == "Bathroom":
					Achievements.get_node('a').modify_achievements("Pepepopo" ,1)
					Achievements.get_node('a').modify_achievements("PEPEPOPO" ,1)
				if scene == "Clean Room":
					Achievements.get_node('a').modify_achievements("happy mom" ,1)
					Achievements.get_node('a').modify_achievements("happy mom very very" ,1)
				if scene == "Shower":
					Achievements.get_node('a').modify_achievements("clean jessy" ,1)
					Achievements.get_node('a').modify_achievements("jessy not masrihoola" ,1)
				if get_node("/root/World/Navigation2D/Jessy")!=null:
					Globals.lastpos = get_node("/root/World/Navigation2D/Jessy").position
			elif mode=="S":
				for a in show:
					get_node(a).show()
			emit_signal("press")
			Globals._on_click()


func close():
	if dist!=-1:
		var vec = position - get_node("/root/World/Navigation2D/Jessy").position
		return vec.length()<dist
	else:
		return -1

func _on_Clickable_mouse_entered():
	inside=true


func _on_Clickable_mouse_exited():
	inside=false
