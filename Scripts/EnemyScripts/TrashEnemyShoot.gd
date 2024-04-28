extends State

# @export var enemy : CharacterBody2D
# @onready var main = get_tree().get_root().get_node("Scene1")
# @onready var projectile = load("res://Scenes/Bullet.tscn")

# var player : CharacterBody2D

# func Enter():
#     player = get_tree().get_first_node_in_group("Player") # get the player from the group
#     print("done")
#     shoot()


# func Physics_Update(delta: float):
#     pass

# func shoot():
#     var instance = projectile.instantiate()
#     instance.dir = enemy.rotation
#     instance.spawnPos = enemy.global_position
#     instance.spawnRot = enemy.rotation
#     main.add_child.call_deferred(instance)