extends AnimatedSprite





func _on_Area2D_body_entered(body):
	animation="playing"


func _on_Area2D_body_exited(body):
	animation="idle"
