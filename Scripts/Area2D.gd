extends Area2D


signal picked_up_item(id)
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
	emit_signal("picked_up_item", 3)
	print("signal emited")
	queue_free()
	

