@tool
extends HBoxContainer

class_name Slots

const NUM_SLOTS : int = 5
static var selected_slot : int = 0
var child_list : Array


func _create_slot_texture_rect(is_selected):
	var img = Image.new()
	if (is_selected):
		img.load("res://Images/inventoryslotselected.png")
	else:
		img.load("res://Images/inventoryslot.png")
	var texture = ImageTexture.new().create_from_image(img)
	var texture_rect = TextureRect.new()
	texture_rect.texture = texture
	return texture_rect


func _swap_textures(old, new):
	var tmp = old.texture
	old.texture = new.texture
	new.texture = tmp
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(NUM_SLOTS):
		var child
		if i == selected_slot:
			child = _create_slot_texture_rect(true)
		else:
			child = _create_slot_texture_rect(false)
		add_child(child)
		child_list.append(child)
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var prev_selected = selected_slot
	if Input.is_key_pressed(KEY_1):
		selected_slot = 0
	elif Input.is_key_pressed(KEY_2):
		selected_slot = 1
	elif Input.is_key_pressed(KEY_3):
		selected_slot = 2
	elif Input.is_key_pressed(KEY_4):
		selected_slot = 3
	elif Input.is_key_pressed(KEY_5):
		selected_slot = 4
	if prev_selected != selected_slot:
		_swap_textures(child_list[prev_selected], child_list[selected_slot])
