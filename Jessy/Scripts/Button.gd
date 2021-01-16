extends Button

export (Array, NodePath) var show = []
export (Array, NodePath) var hide = []
export  (String)  var  scene
export (Array,Array) var globals
export (Array,Array) var functions

export var  mode = ''

func _ready():
	connect("pressed",self,"pressed")

func pressed():
	if not Globals.justClicked:
		if mode.find('C')!=-1:
			get_tree().change_scene("res://Scenes/"+scene+".tscn")
		if mode.find('SH')!=-1:
			for s in show:
				get_node(s).show()
			for h in hide:
				get_node(h).hide()
		if mode.find('G')!=-1:
			for global in globals:
				Globals.set(global[0],global[1])
		if mode.find('F')!=-1:
			for funct in functions:
				Globals.call(funct[0],funct[1])
		Globals._on_click()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
