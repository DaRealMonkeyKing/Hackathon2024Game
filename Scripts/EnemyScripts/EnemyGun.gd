extends Area2D

func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)


func shoot():
	const BULLET = preload("res://Scenes/Bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position # spawns bullet at shooting pos
	new_bullet.global_rotation = %ShootingPoint.global_rotation # spawns bullet at shooting pos
	%ShootingPoint.add_child(new_bullet)

	var new_bullet2 = BULLET.instantiate()
	new_bullet2.global_position = %ShootingPoint2.global_position # spawns bullet at shooting pos
	new_bullet2.global_rotation = %ShootingPoint2.global_rotation # spawns bullet at shooting pos
	%ShootingPoint2.add_child(new_bullet2)

	var new_bullet3 = BULLET.instantiate()
	new_bullet3.global_position = %ShootingPoint3.global_position # spawns bullet at shooting pos
	new_bullet3.global_rotation = %ShootingPoint3.global_rotation # spawns bullet at shooting pos
	%ShootingPoint3.add_child(new_bullet3)


func _on_timer_timeout():
	shoot()
