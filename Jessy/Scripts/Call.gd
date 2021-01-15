extends Control


func pressed(a):
	if not Globals.justClicked:
		Globals.nameCall=a
		get_tree().change_scene("res://Scenes/BotherPeople.tscn")
