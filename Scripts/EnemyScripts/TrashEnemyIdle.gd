extends State
class_name EnemyIdle

@export var enemy: CharacterBody2D # reference of enemy
@export var move_speed := 100.0;

var player: CharacterBody2D

var move_direction : Vector2
var wander_time : float

func randomize_wander():
	move_direction = Vector2(randf_range(-1,1), randf_range(-1,1)).normalized() # rand dir
	wander_time = randf_range(1, 3) # rand wander time

func Enter(): # upon entering idle state
	player = get_tree().get_first_node_in_group("Player")
	randomize_wander()

func Update(delta: float):
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_wander()

func Physics_Update(delta: float):
	if enemy: # if enemy exists
		enemy.velocity = move_direction * move_speed

	var direction = player.global_position - enemy.global_position
	if direction.length() < 1000:
		Transitioned.emit(self, "trashenemyfollow")
