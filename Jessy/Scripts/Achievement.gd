extends HBoxContainer

signal say(string)

var desc



func set_a(name,data):
	desc  = data['description']
	$Name.text = name
	if data['done']==1:
		$Medal.modulate=Color(1,1,1,1)
	$Amount.text=str(data['accomplished'])+"/"+str(data["total"])
	



func _on_Achievement_gui_input(event):
	emit_signal("say",desc)
