extends AnimatedSprite


func _input(event):
	if Input.is_action_just_pressed("click") or Input.is_action_just_pressed("click"):
		if frames.get_frame_count("comp")>(1+frame):
			frame+=1
		else:
			get_tree().change_scene("res://Scenes/World.tscn")
		

