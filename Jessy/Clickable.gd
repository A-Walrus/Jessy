extends Area2D

export var show = []
export (Resource) var res
export var mode="C"


var inside = false

func _input(event):
	if Input.is_action_just_pressed("click") and inside:
		if mode=="C":
			get_tree().change_scene_to(res)
		elif mode=="S":
			for a in show:
				get_node(a).show()
func _on_Clickable_mouse_entered():
	inside=true


func _on_Clickable_mouse_exited():
	inside=false
