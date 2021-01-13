extends Control
var click=false
func _process(delta):
	if Input.is_action_just_pressed("click"):
		if click:
			hide()
			$Center/Bed.hide()
			set_process(false)
			click=false
		click=true

func _ready():
	set_process(false)

func _on_Bed_picked():
	set_process(true)
	show()
	$Center/Bed.show()
	click=false


func _on_sleep_pressed():
	get_tree().change_scene("res://Scenes/Bed.tscn")


func _on_computer_pressed():
	get_tree().change_scene("res://Scenes/Computer.tscn")
