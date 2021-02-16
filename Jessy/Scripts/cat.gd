extends AnimatedSprite
export var cat_name = ''

var time_start = 0
var time_end = 0
var time_pet
func _on_Area2D_body_entered(body):
	if body.name=="Hand":
		animation='pet'
		time_start = OS.get_unix_time()

	else:
		animation="playing"

func _on_Area2D_body_exited(body):
	animation="idle"
	if body.name=="Hand":
		time_end = OS.get_unix_time()
		time_pet = time_end - time_start 
		var seconds = time_pet % 60
		Achievements.get_node('a').modify_achievements(cat_name ,seconds)
