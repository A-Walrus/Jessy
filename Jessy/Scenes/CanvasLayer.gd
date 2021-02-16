extends CanvasLayer

var popupOn = false
var queue = 0
var file = File.new()
var dict = {}
onready var popup = get_node("Panel")
onready var timer = get_node("Timer")
onready var tween = get_node("Tween")
var defaultData = {"food no":{"total":1, "description":"say no to food", "accomplished":0, "name":"food no", "done":0},
"FOOD NOOO":{"total":10, "description":"say no to food 10 times", "accomplished":0, "name":"FOOD NOOO", "done":0},
"suicidal thoughts":{"total":1, "description":"do your homework", "accomplished":0, "name":"suicidal thoughts", "done":0},
"JESSY DONT DO IT":{"total":10, "description":"do your homework 10 times", "accomplished":0, "name":"JESSY DONT DO IT", "done":0},
"pet tomy":{"total":120, "description":"pet tomy for 2 minutes", "accomplished":0, "name":"pet tomy", "done":0},
"pet sammy":{"total":120, "description":"pet semy for 2 minutes", "accomplished":0, "name":"pet sammy", "done":0},
"GamerJess123":{"total":20, "description":"play a random game 20 times", "accomplished":0, "name":"GamerJess123", "done":0},
"ArtisArt":{"total":1, "description":"draw something", "accomplished":0, "name":"ArtisArt", "done":0},
"Beautiful":{"total":10, "description":"draw something 10 times", "accomplished":0, "name":"Beautiful", "done":0},
"I can see now":{"total":1, "description":"cut your bangs", "accomplished":0, "name":"I can see now", "done":0},
"I'm pretty":{"total":1, "description":"do your makeup", "accomplished":0, "name":"I'm pretty", "done":0},
"I'm pretty very very":{"total":5, "description":"do your makeup 5 times", "accomplished":0, "name":"I'm pretty very very", "done":0},
"MY HAIR":{"total":8, "description":"cut your bangs 8 times", "accomplished":0, "name":"MY HAIR", "done":0},
"bullied by ron":{"total":6, "description":"play brawlhalla 6 times", "accomplished":0, "name":"bullied by ron", "done":0},
"clean jessy":{"total":1, "description":"go to the shower", "accomplished":0, "name":"clean jessy", "done":0},
"jessy not masrihoola":{"total":6, "description":"go to the shower 6 times", "accomplished":0, "name":"jessy not masrihoola", "done":0},
"instajess":{"total":15, "description":"enter instagram 15 times", "accomplished":0, "name":"instajess", "done":0},
"Peepeepoopoo":{"total":1, "description":"go to the toilet", "accomplished":0, "name":"Peepeepoopoo", "done":0},
"PEEPEEPOOPOO":{"total":10, "description":"go to the toilet 10 times", "accomplished":0, "name":"PEEPEEPOOPOO", "done":0},
"happy mom":{"total":1, "description":"clean your room ", "accomplished":0, "name":"happy mom", "done":0},
"happy mom very very":{"total":10, "description":"clean your room 10 times", "accomplished":0, "name":"happy mom very very", "done":0},
"goodbye world":{"total":120, "description":"sleep for 2 minutes", "accomplished":0, "name":"goodbye world", "done":0}
}

func _ready():
	read_achievements()

func read_achievements():
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

func write_achievements():
	file.open("user://achivements.json", file.WRITE)
	file.store_string(to_json(dict))
	file.close()

func modify_achievements(achievement, value):
	if value == 0:
		dict[achievement].accomplished = 0
	if dict[achievement].accomplished < dict[achievement].total:
		dict[achievement].accomplished += value
		write_achievements()
	if dict[achievement].accomplished >= dict[achievement].total:
		if dict[achievement].done == 0:
			dict[achievement].done = 1
			if queue == 0:
				popup.get_node("Name").set_text(dict[achievement].name)
				write_achievements()
				_show_popup()
				queue = queue + 1
			else:
				queue = queue + 1
				yield(get_tree().create_timer(4.0 * queue), "timeout")
				popup.get_node("Name").set_text(dict[achievement].name)
				write_achievements()
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
	queue = queue - 1
func _on_Timer_timeout():
	_hide_popup()
