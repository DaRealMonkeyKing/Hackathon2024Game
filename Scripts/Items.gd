@tool
extends HBoxContainer

const TEXTURES = [
	preload("res://Images/stick.png"),
	preload("res://Images/healthpot.png")
]

var item_list : Array

# func _create_slot_texture_rect(is_selected):
# 	var img = Image.new()
# 	if (is_selected):
# 		img.load("res://Images/inventoryslotselected.png")
# 	else:
# 		img.load("res://Images/inventoryslot.png")
# 	var texture = ImageTexture.new().create_from_image(img)
# 	var texture_rect = TextureRect.new()
# 	texture_rect.texture = texture
# 	return texture_rect

func _add_item(id : int):
	var texture_rect = TextureRect.new()
	texture_rect.texture = TEXTURES[id]
	item_list.append(texture_rect)
	add_child(texture_rect)


# Called when the node enters the scene tree for the first time.
func _ready():
	#for i in range(get_child_count()):
		#item_list.append(get_child(i))
	
	_add_item(0)
	_add_item(1)
	_add_item(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Input.is_key_pressed(KEY_X):
		#remove_child(item_list[0])
	pass
