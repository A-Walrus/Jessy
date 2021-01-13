extends Label

export (NodePath) var yes
export (NodePath) var no

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func reset():
	text="Do you want to eat?"
	get_node(yes).show()
	get_node(no).show()

func _on_yes_pressed():
	text="incorrect"
	get_node(yes).hide()
	get_node(no).hide()
	$Timer.start()


func _on_no_pressed():
	text="correct"
	get_node(yes).hide()
	get_node(no).hide()
	$Timer.start()
