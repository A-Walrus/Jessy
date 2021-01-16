extends Node

onready var art = $Art
onready var pop = $Pop
onready var books =$Books

var list


func _ready():
	list = [art,pop,books]

func check():
	for l in list:
		if not l.check():
			return false
	get_tree().change_scene("res://Scenes/World.tscn")

func _input(event):
	if Input.is_action_just_pressed("click"):
		check()
