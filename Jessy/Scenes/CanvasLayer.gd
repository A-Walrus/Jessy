extends CanvasLayer


export(String, FILE) var file_path
var file = File.new()
var dict = {}
var already_played = false
onready var popup = get_node("Panel")
onready var timer = get_node("Timer")
onready var tween = get_node("Tween")


func _ready():
	read_achivements()
func read_achivements():
	var text
	if file.file_exists("user://achivements.json"):
		file.open("user://achivements.json")
		text = file.get_as_text()
		dict = parse_json(text)
		file.close()
	else:
			file.open(file_path, file.READ)
			text = file.get_as_text()
			dict = parse_json(text)
			write_achivements()
func write_achivements():
	if file.file_exists("user://achivements.json"):
		file.open("user://achivements.json", file.WRITE)
		file.store_string(dict.to_json())
		file.close()
func modify_achivements(achivement, value):
	if value == 0:
		dict[achivement].accomplished = 0
	if dict[achivement].accomplished < dict[achivement].total:
		dict[achivement].accomplished += value
	if dict[achivement].accomplished >= dict[achivement].total:
		popup.get_node("Name").set_text(dict[achivement].name)
		_show_popup()
func _show_popup():
	popup.show()
	tween.interpolate_property(popup, "rect/pos", popup.get_pos(), popup.getpos() - 0.5, tween.TRANS_BACK, tween.EASE_IN)
	tween.start()
	timer.start()

func _hide_popup():
	tween.interpolate_property(popup, "rect/pos", popup.get_pos(), popup.getpos() + 0.5, tween.TRANS_BACK, tween.EASE_IN)
	tween.start()
	yield(tween, "tween_complete")
	popup.hide()
func on_Timer_timeout():
	_hide_popup()
