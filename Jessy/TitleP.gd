extends Label



func _on_insta_pressed():
	get_tree().change_scene("res://Scenes/Instagram.tscn")


func _on_Game_pressed():
	Globals.random=true
	get_tree().change_scene("res://Scenes/Random Game.tscn")


func _on_Game2_pressed():
	Globals.random=false
	get_tree().change_scene("res://Scenes/Random Game.tscn")
