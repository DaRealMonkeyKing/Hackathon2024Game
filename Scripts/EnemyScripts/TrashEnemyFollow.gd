extends State
class_name TrashEnemyFollow

@export var enemy: CharacterBody2D
@export var move_speed := 250
var player : CharacterBody2D

func Enter():
    player = get_tree().get_first_node_in_group("Player") # get the player from the group

func Physics_Update(delta: float):
    var direction = player.global_position - enemy.global_position

    if direction.length() > 150: # how far away the enemy should stop
        enemy.velocity = direction.normalized() * move_speed
        #Transitioned.emit(self, "trashenemyshoot")
    else:
        enemy.velocity = Vector2() # stand still

    if direction.length() > 1000: # if too far
        Transitioned.emit(self, "trashenemyidle")