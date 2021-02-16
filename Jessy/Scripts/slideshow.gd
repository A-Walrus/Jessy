extends AnimatedSprite


func _input(event):
	if not Globals.justClicked:
		if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("click"):
			var a =frame
			frame+=1
			if frame==a:
				if(get_tree().get_current_scene().get_name() == "HW"):
					Achievements.get_node('a').modify_achievements("suicidal thoughts" ,1)
					Achievements.get_node('a').modify_achievements("JESSY DONT DO IT" ,1)
				get_tree().change_scene("res://Scenes/World.tscn")
		Globals.justClicked
		

