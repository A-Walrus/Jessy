extends AnimatedSprite


func _input(event):
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("click"):
		var a =frame
		frame+=1
		if frame==a:
			get_tree().change_scene("res://Scenes/World.tscn")
		

