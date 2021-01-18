extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Globals.drawing!=null:
		add_child(Globals.drawing)
		Globals.drawing.show()
