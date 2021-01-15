extends AnimatedSprite

var timeShort = 90
var timeLong = 180
export (NodePath) var ui
export (NodePath) var foodUI
export (NodePath) var title

func _ready():
	$Door.start(rand_range(timeShort,timeLong))
	


func _on_Door_timeout():
	animation="open"
	$FromOpen.start()
	


func _on_FromOpen_timeout():
	get_node(ui).show()
	get_node(foodUI).show()


func _on_Timer_timeout():
	get_node(ui).hide()
	get_node(foodUI).hide()
	get_node(title).reset()
	animation="close"
	$Door.start(rand_range(timeShort,timeLong))
