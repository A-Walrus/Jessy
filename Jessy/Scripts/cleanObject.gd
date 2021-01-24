extends drag


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	position.x = rand_range(-66,970)
	position.y = rand_range(-550,670)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
