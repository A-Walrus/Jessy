extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
func _exit_tree():
	if get_tree().get_current_scene().get_name() == "Drawing":
		var bounds = get_node("/root/Drawing").page_bounds
		var transform = get_viewport_transform()
		var sca = transform.get_scale()
		region_rect = Rect2(transform.xform(bounds.position),transform.xform(bounds.size))
		scale = Vector2(1/sca.x,1/sca.y)
		var img = get_viewport().get_texture().get_data()
		var itex = ImageTexture.new()
		img.flip_y()
		itex.create_from_image(img)
		set_texture(itex)
		Globals.drawing = self.duplicate()

