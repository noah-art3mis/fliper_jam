extends Sprite

var WIDTH = 256
var HEIGHT = 224

func _ready():
	pass
#	var node = Viewport.new()
#	add_child(node)
#	node.set_size_override(true, Vector2(WIDTH, HEIGHT)) # Custom size for 2D.
	
func _process(_delta):
	var img = get_viewport().get_texture().get_data()
	img.flip_y()
	var tex = ImageTexture.new()
	tex.create_from_image(img)
	# Set sprite texture.
	texture = tex
