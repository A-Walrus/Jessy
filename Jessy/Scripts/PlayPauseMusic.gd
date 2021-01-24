extends Button

var isPaused = false
var currentPosition
var Music
var MuteIcon = preload("res://Art/icons/mute.png")
var UnMuteIcon = preload("res://Art/icons/unmute.png")
onready var Icon = get_node("Icon")
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
	pass


func _on_PlayPauseMusic_button_up():
	if(!isPaused):
		currentPosition = Music.get_playback_position()
		Music.stop()
		Icon.set_texture(MuteIcon)
	else:
		Music.play(currentPosition)
		Icon.set_texture(UnMuteIcon)
	isPaused = not isPaused
