extends Node2D

func _ready():
	if Globals.random:
		randomize()
		$AnimatedSprite.frame = rand_range(0,4)
	else:
		$AnimatedSprite.frame = 4

func _input(event):
	if Input.is_action_just_pressed("click"):
		get_tree().change_scene("res://Scenes/World.tscn")
