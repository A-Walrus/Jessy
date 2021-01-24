extends CanvasLayer


var file = File.new()
var dict = {}
onready var popup = get_node("Panel")
onready var timer = get_node("Timer")
onready var tween = get_node("Tween")
var defaultData = {"food no":{"total":1, "description":"say no to food", "accomplished":0, "name":"food no"},
"FOOD NOOO":{"total":10, "description":"say no to food 10 times", "accomplished":0, "name":"FOOD NOOO"},
"suicidal thoughts":{"total":1, "description":"do your homework", "accomplished":0, "name":"suicidal thoughts"},
"JESSY DONT DO IT":{"total":10, "description":"do your homework 10 times", "accomplished":0, "name":"JESSY DONT DO IT"},
"pet tomy":{"total":120, "description":"pet tomy for 2 minutes", "accomplished":0, "name":"pet tomy"},
"pet semy":{"total":120, "description":"pet semy for 2 minutes", "accomplished":0, "name":"pet semy"},
"GamerJess123":{"total":20, "description":"play a random game 20 times", "accomplished":0, "name":"GamerJess123"},
"ArtisArt":{"total":1, "description":"draw something", "accomplished":0, "name":"ArtisArt"},
"Beautyful":{"total":10, "description":"draw something 10 times", "accomplished":0, "name":"Beautyful"},
"I can see now":{"total":1, "description":"cut your bangs", "accomplished":0, "name":"I can see now"},
"I'm pretty":{"total":1, "description":"do your makeup", "accomplished":0, "name":"I'm pretty"},
"I'm pretty very very":{"total":5, "description":"do your makeup 5 times", "accomplished":0, "name":"I'm pretty very very"},
"MY HAIR":{"total":8, "description":"cut your bangs 8 times", "accomplished":0, "name":"MY HAIR"},
"bullied by ron":{"total":120, "description":"play brawlhalla for 2 minutes", "accomplished":0, "name":"bullied by ron"},
"clean jessy":{"total":1, "description":"go to the shower", "accomplished":0, "name":"clean jessy"},
"very clean jessy":{"total":6, "description":"go to the shower 6 times", "accomplished":0, "name":"very clean jessy"},
"instajess":{"total":120, "description":"be on instagram for 2 minutes", "accomplished":0, "name":"instajess"},
"Pepepopo":{"total":1, "description":"go to the toilet", "accomplished":0, "name":"Pepepopo"},
"PEPEPOPO":{"total":10, "description":"go to the toilet 10 times", "accomplished":0, "name":"PEPEPOPO"},
"happy mom":{"total":10, "description":"clean your room 10 times", "accomplished":0, "name":"happy mom"},
"goodbye world":{"total":120, "description":"sleep for 2 minutes", "accomplished":0, "name":"goodbye world"}
}

func _ready():
	read_achivements()
	#_show_popup()

func read_achivements():
	var text
	if file.file_exists("user://achivements.json"):
		file.open("user://achivements.json",file.READ)
		text = file.get_as_text()
		dict = parse_json(text)
		file.close()
	else:
		file.open("user://achivements.json", file.WRITE)
		file.store_string(to_json(defaultData))
		file.close()
		dict = defaultData

func write_achivements():
	file.open("user://achivements.json", file.WRITE)
	file.store_string(to_json(dict))
	file.close()

func modify_achivements(achivement, value):
	if value == 0:
		dict[achivement].accomplished = 0
	if dict[achivement].accomplished < dict[achivement].total:
		dict[achivement].accomplished += value
		write_achivements()
	if dict[achivement].accomplished >= dict[achivement].total:
		popup.get_node("Name").set_text(dict[achivement].name)
		_show_popup()

func _show_popup():
	popup.show()
	tween.interpolate_property(popup, "rect_position", Vector2(popup.rect_position.x, popup.rect_position.y), Vector2(popup.rect_position.x, popup.rect_position.y - 250), 1, tween.TRANS_BACK, tween.EASE_OUT)
	tween.start()
	timer.start()

func _hide_popup():
	tween.interpolate_property(popup, "rect_position", Vector2(popup.rect_position.x, popup.rect_position.y), Vector2(popup.rect_position.x, popup.rect_position.y + 250), 1, tween.TRANS_BACK, tween.EASE_IN)
	tween.start()
	yield(tween, "tween_completed")
	popup.hide()
	
func _on_Timer_timeout():
	_hide_popup()
