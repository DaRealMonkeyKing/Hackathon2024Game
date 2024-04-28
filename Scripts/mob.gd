extends CharacterBody2D

@onready var player = get_node("/root/Game/PlayerCharacter")

var mobSpeed = 300.0;

func _physics_process(delta):
	followPlayer()


func followPlayer():
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * mobSpeed
	move_and_slide()

