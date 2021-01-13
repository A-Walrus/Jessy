extends Node

signal picked()

func _on_Click_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		if(get_node("../Navigation2D/Jessy/kine") in $Stand.get_overlapping_bodies()):
			emit_signal("picked")
