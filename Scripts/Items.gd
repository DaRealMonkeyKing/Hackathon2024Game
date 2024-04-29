@tool
extends HBoxContainer

const NUM_SLOTS = 5
const TEXTURES = [
	preload("res://Images/stick.png"),
	preload("res://Images/healthpot.png"),
	preload("res://Images/recycling_bin.png")
]

var item_list : Array
var selected_item = 0;


func _add_item(id : int):
	if (len(item_list) == NUM_SLOTS):
		print("Inventory Full")
		return
	var texture_rect = TextureRect.new()
	texture_rect.texture = TEXTURES[id]
	item_list.append(texture_rect)
	add_child(texture_rect)


func _drop_item():
	pass


# Called when the node enters the scene tree for the first time.
func _ready():
	_add_item(0)
	_add_item(1)
	_add_item(2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_1):
		selected_item = 0
	elif Input.is_key_pressed(KEY_2):
		selected_item = 1
	elif Input.is_key_pressed(KEY_3):
		selected_item = 2
	elif Input.is_key_pressed(KEY_4):
		selected_item = 3
	elif Input.is_key_pressed(KEY_5):
		selected_item = 4
	# Drop button
	elif Input.is_key_pressed(KEY_Q):
		_drop_item()

	
