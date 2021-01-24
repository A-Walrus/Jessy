extends Node2D

func _input(event):
	if Input.is_action_just_pressed("click"):
		if($AnimatedSprite.animation=="off"):
			$AnimatedSprite.animation="on"
			get_node("AudioStreamPlayer").play()
		else:
			get_tree().change_scene("res://Scenes/World.tscn")


func _on_AudioStreamPlayer2D_finished():
	get_tree().change_scene("res://Scenes/World.tscn")
