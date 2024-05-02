extends HBoxContainer

const texture_selected = preload("res://Images/inventoryslotselected.png")
const texture_unselected = preload("res://Images/inventoryslot.png")

#const NUM_SLOTS : int = 5
#static var selected_slot : int = 0
var child_list : Array


func _create_slot_texture_rect(is_selected):
	var texture_rect = TextureRect.new()
	if (is_selected):
		texture_rect.texture = texture_selected
	else:
		texture_rect.texture = texture_unselected
	return texture_rect


func _swap_textures(a, b):
	var tmp = a.texture
	a.texture = b.texture
	b.texture = tmp
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(InventoryManager.NUM_SLOTS):
		var child
		if i == InventoryManager.selected_slot:
			child = _create_slot_texture_rect(true)
		else:
			child = _create_slot_texture_rect(false)
		add_child(child)
		child_list.append(child)
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var prev_selected = InventoryManager.selected_slot
	if Input.is_key_pressed(KEY_1):
		InventoryManager.selected_slot = 0
	elif Input.is_key_pressed(KEY_2):
		InventoryManager.selected_slot = 1
	elif Input.is_key_pressed(KEY_3):
		InventoryManager.selected_slot = 2
	elif Input.is_key_pressed(KEY_4):
		InventoryManager.selected_slot = 3
	elif Input.is_key_pressed(KEY_5):
		InventoryManager.selected_slot = 4
	if prev_selected != InventoryManager.selected_slot:
		_swap_textures(child_list[prev_selected], child_list[InventoryManager.selected_slot])
