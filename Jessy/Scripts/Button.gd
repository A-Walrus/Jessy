extends Button

export (Array, NodePath) var show = []
export (Array, NodePath) var hide = []
export  (String)  var  scene
export  (String)  var  Pscene
export (Array,Array) var globals
export (Array,Array) var functions

export var  mode = ''

func _ready():
	connect("pressed",self,"pressed")

func pressed():
	if not Globals.justClicked:
		if mode.find('C')!=-1:
			if scene == "Haircut":
				Achievements.get_node('a').modify_achievements("MY HAIR" ,1)
				Achievements.get_node('a').modify_achievements("I can see now" ,1)
			if scene == "Makeup":
				Achievements.get_node('a').modify_achievements("I'm pretty" ,1)
				Achievements.get_node('a').modify_achievements("I'm pretty very very" ,1)
			if scene == "Drawing":
				Achievements.get_node('a').modify_achievements("ArtisArt" ,1)
				Achievements.get_node('a').modify_achievements("Beautiful" ,1)
			if scene == "HW":
				Achievements.get_node('a').modify_achievements("suicidal thoughts" ,1)
				Achievements.get_node('a').modify_achievements("JESSY DONT DO IT" ,1)
			if Pscene == "random game":
				Achievements.get_node('a').modify_achievements("GamerJess123" ,1)
			if Pscene == "brawlhalla":
				Achievements.get_node('a').modify_achievements("bullied by ron" ,1)
			if Pscene == "instagram":
				Achievements.get_node('a').modify_achievements("instajess" ,1)
			get_tree().change_scene("res://Scenes/"+scene+".tscn")
			if get_node("/root/World/Navigation2D/Jessy")!=null:
				Globals.lastpos = get_node("/root/World/Navigation2D/Jessy").position
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
