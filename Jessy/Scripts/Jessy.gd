extends AnimatedSprite

export (Array,Resource) var outfits

# Called when the node enters the scene tree for the first time.
func _ready():
	change()
	Globals.connect("outfit",self,"change")
	position = Globals.lastpos
	if(get_tree().get_current_scene().get_name() == "Outift room"):
		position = Vector2(515.201,359.477)


func change():
	frames = outfits[Globals.outfit]
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
