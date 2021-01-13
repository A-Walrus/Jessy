extends Control



func _on_Bed_picked():
	show()
	$Center/Bed.show()


func _on_sleep_pressed():
	get_tree().change_scene("res://Scenes/Bed.tscn")
