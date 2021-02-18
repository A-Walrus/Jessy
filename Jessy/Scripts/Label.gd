extends Label

export var a  = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	text=Globals.nameCall
	if text in a:
		$AudioStreamPlayer.stream = a[text]
		$AudioStreamPlayer.play()
	
