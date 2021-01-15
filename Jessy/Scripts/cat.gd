extends AnimatedSprite





func _on_Area2D_body_entered(body):
	if body.name=="Hand":
		animation='pet'
	else:
		animation="playing"


func _on_Area2D_body_exited(body):
	animation="idle"
