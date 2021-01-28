extends AnimatedSprite

var timeShort = 15
var timeLong = 90
export (NodePath) var ui
export (NodePath) var foodUI
export (NodePath) var title

func _ready():
	$Door.start(rand_range(timeShort,timeLong))
	


func _on_Door_timeout():
	if get_node(ui).is_visible()==false:
		animation="open"
		$FromOpen.start()
	else:
		$Door.start(rand_range(timeShort,timeLong))
	


func _on_FromOpen_timeout():
	get_node(ui).show()
	get_node(foodUI).show()


func _on_Timer_timeout():
	get_node(ui).hide()
	get_node(foodUI).hide()
	get_node(title).reset()
	animation="close"
	$Door.start(rand_range(timeShort,timeLong))
