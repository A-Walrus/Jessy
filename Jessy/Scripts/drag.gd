extends KinematicBody2D

# Pickable needs to be selected from the inspector

var can_grab = false
var grabbed_offset = Vector2()

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		can_grab = event.pressed
		grabbed_offset = position - get_global_mouse_position()
		if Input.is_action_just_pressed("click"):
			Globals.dragging=name
		if Input.is_action_just_released("click"):
			Globals.dragging=""

func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_grab and Globals.dragging==name:
		position = get_global_mouse_position() + grabbed_offset
