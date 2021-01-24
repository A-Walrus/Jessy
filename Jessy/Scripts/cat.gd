extends AnimatedSprite



func _on_Area2D_body_entered(body):
	if body.name=="Hand":
		animation='pet'
		Achievements.get_node('a').modify_achivements('pet tomy',60)
	else:
		animation="playing"


func _on_Area2D_body_exited(body):
	animation="idle"
