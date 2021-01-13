extends Control


func pressed(a):
	Globals.nameCall=a
	get_tree().change_scene("res://Scenes/Bother people.tscn")
