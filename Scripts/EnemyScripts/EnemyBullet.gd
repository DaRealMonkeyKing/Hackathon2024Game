extends Area2D

var travelled_distance = 0
var BULLET_DMG = 10

func _physics_process(delta):
	const SPEED = 5000
	const RANGE = 2000
	var direction = Vector2.RIGHT.rotated(rotation) # gets the direction the bullet is pointing
	position += direction * SPEED * delta # bullets are time dependant rather than frame dependant

	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body:Node2D):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage(BULLET_DMG)
