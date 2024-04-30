extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", good_name)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func good_name(body):
	print("item picked up")
	print(body.name)
	if body.name != "PlayerCharacter":
		return
	SignalManager.picked_up_item.emit(3)
	queue_free()
	

