extends Button

export (Array, NodePath) var show = []
export (Array, NodePath) var hide = []
export  (String)  var  scene
export var  mode = ''

func _ready():
	connect("pressed",self,"pressed")

func pressed():
	if not Globals.justClicked:
		if mode=='C':
			get_tree().change_scene("res://Scenes/"+scene+".tscn")
		if mode== 'SH':
			for s in show:
				get_node(s).show()
			for h in hide:
				get_node(h).hide()
		Globals._on_click()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
