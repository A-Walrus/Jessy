extends AnimatedSprite


func _ready():
	play()

func _on_AnimatedSprite_animation_finished():
	stop()
	frame=1

func _input(event):
	if Input.is_action_just_pressed("click"):
		frame=0
		$Timer.start()




func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/World.tscn")
