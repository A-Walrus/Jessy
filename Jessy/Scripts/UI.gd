extends Control

var menus = []

func _ready():
	for i in range(0,get_child_count()-1):
		menus.append(get_child(i+1).get_path())
		
func _input(event):
	if Input.is_action_just_pressed("escape"):
		for i in menus:
			get_node(i).hide()
		self.hide()
