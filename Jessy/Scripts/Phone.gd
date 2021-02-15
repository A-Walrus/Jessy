extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Globals.random=="r":
		frame = rand_range(0,4)
	else:
		frame = int(Globals.random)

