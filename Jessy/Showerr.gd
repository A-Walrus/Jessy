extends Node2D

func _input(event):
	if Input.is_action_just_pressed("click"):
		if($AnimatedSprite.animation=="off"):
			$AnimatedSprite.animation="on"
		else:
			get_tree().change_scene("res://Scenes/World.tscn")