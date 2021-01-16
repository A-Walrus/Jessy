extends KinematicBody2D

var initpos = position
var dragable = false
var grabbed_offset = Vector2()
var onface = false;
var steps = ["Blank", "Concealer","Powder","Blush","Lipstick","Eyeliner","Mascara","Blank"]
var outfit = Globals.outfit
var step = 1


func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		dragable = event.pressed
		grabbed_offset = position - get_global_mouse_position()

func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and dragable:
		position = get_global_mouse_position() + grabbed_offset
	else:
		position = initpos
		
	if Input.is_action_just_released("click") and onface:
		if(step < 7):
			get_child(0).animation = steps[step+1] #str(steps[step+1])
			get_node("../Jessy/Jessy").animation = steps[step]
			get_node("../Jessy/Jessy").frame = outfit
			step = step + 1

func _on_Jessy_body_entered(body):
	onface = true

func _on_Jessy_body_exited(body):
	onface = false
	
#Concealer
#Powder
#Blush
#Lipstick
#Eyeliner
#Mascara
