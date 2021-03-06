extends KinematicBody2D

var initpos = position
var dragable = false
var grabbed_offset = Vector2()
var onhair = false
var trans = 1
var oldMousePos = get_global_mouse_position()
var rng = RandomNumberGenerator.new()

func _ready():
	get_node("../Jessy/Jessy_long").frame = Globals.outfit
	get_node("../Jessy/Jessy_short").frame = Globals.outfit

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		dragable = event.pressed
		grabbed_offset = position - get_global_mouse_position()

func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and dragable:
		position = get_global_mouse_position() + grabbed_offset
	else:
		position = initpos
	get_node("../Jessy/Jessy_long").set_modulate(Color(1,1,1,trans))
	if(!onhair or get_global_mouse_position() == oldMousePos):
		$Hair.emitting = false
	oldMousePos = get_global_mouse_position()
	
func _input(event):
	if event is InputEventMouseMotion and onhair:
		var d = (0.005 / (abs(event.get_relative().y)+1))
		trans = trans - d
		if(d> 0.00025 and !trans <= 0):
			$Hair.emitting = true
		else:
			$Hair.emitting = false
	if(trans <= 0):
		get_node("../Button").show()



func _on_Jessy_body_entered(body):
	onhair = true

func _on_Jessy_body_exited(body):
	onhair = false
