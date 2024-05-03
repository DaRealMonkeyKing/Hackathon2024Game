extends Node2D


signal open_recycling_bin
signal close_recycling_bin

var recycling_menu_open : bool
var num_recyclables = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	recycling_menu_open = false
	#Input.set_use_accumulated_input(false)
	

func _use_recycling_bin():
	recycling_menu_open = not recycling_menu_open
	if recycling_menu_open:
		_open_recycling_bin()
	else:
		_close_recycling_bin()


func _open_recycling_bin():
	$Menu.visible = true
	$RecycleButton.visible = true
	num_recyclables = 0
	for x in InventoryManager.item_list:
		if InventoryManager.item_id_map[x[0]] == "recyclable":
			num_recyclables += 1
			
	var s = "RECYCLING BIN!"
	s += "\nYou have " + str(num_recyclables) + " recyclables"
	$Menu.text = s
	

func _close_recycling_bin():
	$Menu.visible = false
	$RecycleButton.visible = false
	
	
func _input(event):
	if event is InputEventMouseButton and InventoryManager.get_selected_item() == "recycling bin":
		if event.button_index == 2 and event.pressed:  # Right mouse button clicked
			_use_recycling_bin()
		


func _on_recycle_button_pressed():
	if num_recyclables == 0:
		return
	num_recyclables -= 1
	InventoryManager.recycle()
	$Menu.text = "RECYCLING BIN!\nYou have " + str(num_recyclables) + " recyclables"
