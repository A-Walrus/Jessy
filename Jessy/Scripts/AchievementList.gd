extends VBoxContainer

onready var achievement  = preload("res://Scenes/Achievement.tscn")

export (NodePath) var desc
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var data = Achievements.get_node('a').dict
	for a in data:
		var achieve = achievement.instance()
		achieve.connect("say",self,"display")
		add_child(achieve)
		achieve.set_a(a,data[a])

func display(text):
	get_node(desc).text=text
	
