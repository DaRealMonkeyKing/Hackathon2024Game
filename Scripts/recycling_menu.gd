extends Node2D


signal open_recycling_bin
signal close_recycling_bin

var recycling_menu_open : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	recycling_menu_open = false
	open_recycling_bin.connect(_on_open_recycling_bin)
	close_recycling_bin.connect(_on_close_recycling_bin)
	
	SignalManager.use_recycling_bin.connect(_on_used_recycling_bin)

func _on_used_recycling_bin():
	recycling_menu_open = not recycling_menu_open
	if recycling_menu_open:
		open_recycling_bin.emit()
	else:
		close_recycling_bin.emit()


func _on_open_recycling_bin():
	$Menu.text = "RECYCLING BIN!"
	

func _on_close_recycling_bin():
	$Menu.text = ""
	
	
func _input(event):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		print("HELLO")
		SignalManager.use_recycling_bin.emit()
		
