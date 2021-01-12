extends Area2D

export var a = []
var b = []
var done = false

func comp(ls_a, ls_b):
	for thing in a:
		b.append(get_node(thing))
	for item in ls_a:
		if not item in ls_b:
			return false
	return true

func check():
	return comp(b,get_overlapping_bodies())


