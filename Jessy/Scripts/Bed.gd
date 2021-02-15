extends AnimatedSprite

var time_start = 0
var time_end = 0
var time_sleep

func _ready():
	play()

func _on_AnimatedSprite_animation_finished():
	stop()
	frame=1
	time_start = OS.get_unix_time()

func _input(event):
	if Input.is_action_just_pressed("click"):
		frame=0
		time_end = OS.get_unix_time()
		time_sleep = time_end - time_start
		var seconds = time_sleep % 60
		Achievements.get_node('a').modify_achievements("goodbye world" ,seconds)
		$Timer.start()




func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/World.tscn")
