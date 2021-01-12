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

func _on_Art_body_shape_entered(body_id, body, body_shape, area_shape):
	check()


func _on_Pop_body_shape_entered(body_id, body, body_shape, area_shape):
	check()


func _on_Books_body_shape_entered(body_id, body, body_shape, area_shape):
	check()
