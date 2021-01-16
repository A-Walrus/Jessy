extends AnimatedSprite

export (Array,Resource) var outfits

# Called when the node enters the scene tree for the first time.
func _ready():
	change()
	Globals.connect("outfit",self,"change")


func change():
	frames = outfits[Globals.outfit]
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
