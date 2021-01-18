extends Node

export (Array,Resource) var brushes
export var index = 0
var line
var pos



export (Rect2) var page_bounds

func _ready():
	page_bounds = Rect2($CanvasLayer/Margin.rect_position,$CanvasLayer/Margin.rect_size)

func _input(event):
	if Input.is_action_pressed("click"):
		if page_bounds.has_point(event.position):
			pos = event.position
	if Input.is_action_just_pressed("click"):
		if page_bounds.has_point(event.position):
			line = brushes[index].instance()
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
