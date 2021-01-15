extends Node

var line
var pos

func _input(event):
	if Input.is_action_pressed("click"):
		pos = event.position
	if Input.is_action_just_pressed("click"):
		line = Line2D.new()
		line.end_cap_mode=Line2D.LINE_CAP_ROUND
		line.joint_mode=Line2D.LINE_JOINT_ROUND
		line.default_color=Color(0,0,0)
		line.width=5
		$Container.add_child(line)
		$Timer.start()
	if Input.is_action_just_released("click"):
		$Timer.stop()


func _on_Timer_timeout():
	if Input.is_action_pressed("click"):
		line.add_point(pos)


func _on_Button_pressed():
	for child in $Container.get_children():
		child.queue_free()
