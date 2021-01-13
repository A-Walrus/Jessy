extends Button

var isPaused = false
var currentPosition
var Music
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Music = get_child(0)
	Music.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PlayPauseMusic_pressed():
	if(!isPaused):
		currentPosition = Music.get_playback_position()
		Music.stop()
	else:
		Music.play(currentPosition)
	isPaused = not isPaused
