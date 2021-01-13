extends AnimatedSprite


func _input(event):
	if Input.is_action_just_pressed("click") or Input.is_action_just_pressed("click"):
		if animation =="home":
			animation="desktop"
		elif animation =="desktop":
			get_tree().change_scene("res://Scenes/World.tscn")
