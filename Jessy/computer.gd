extends AnimatedSprite


func _input(event):
	if Input.is_action_just_pressed("click") or Input.is_action_just_pressed("click"):
		frame+=1


func _on_computer_animation_finished():
	get_tree().change_scene("res://Scenes/World.tscn")
