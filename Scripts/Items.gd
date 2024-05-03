extends HBoxContainer


#var item_list : Array

func _add_item(id : int):
	var texture_rect = TextureRect.new()
	texture_rect.texture = InventoryManager.TEXTURES[id]
	InventoryManager.item_list.append([id, texture_rect])
	add_child(texture_rect)


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.picked_up_item.connect(_add_item)
	_add_item(0)
	_add_item(1)
	_add_item(2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
