@tool
extends Node


const NUM_SLOTS = 5
var selected_slot : int 
var item_list : Array

const TEXTURES = [
	preload("res://Images/stick.png"),
	preload("res://Images/healthpot.png"),
	preload("res://Images/recycling_bin.png"),
	preload("res://Images/lootdrops.png")
]

const item_id_map = {
	0: "stick",
	1: "health potion",
	2: "recycling bin",
	3: "recyclable"
}

# Called when the node enters the scene tree for the first time.
func _ready():
	selected_slot = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func get_selected_item():
	var id = item_list[selected_slot][0]
	return item_id_map[id]


func recycle():
	var to_remove = -1
	for i in range(len(item_list)):
		if item_id_map[item_list[i][0]] == "recyclable":
			item_list[i][1].queue_free()
			to_remove = i
			break
	item_list.remove_at(to_remove)
