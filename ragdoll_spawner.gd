extends Node2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D


func spawn_ragdoll() -> void:
	var container: Node2D = Global.get_game().obstacle_spawner.obstacles_container
	print_debug(get_parent().name + ".spawn_ragdoll()")
	var ragdoll = RigidBody2D.new()
	ragdoll.collision_layer = 0
	ragdoll.collision_mask = 0
	ragdoll.set_collision_mask_value(1, true)
	ragdoll.global_position = get_parent().global_position
	ragdoll.z_index = get_parent().z_index
	ragdoll.global_rotation = get_parent().global_rotation
	var shadow = Shadow.new()
	ragdoll.add_child(shadow)
	ragdoll.add_child(sprite.duplicate())
	ragdoll.add_child(collision_shape.duplicate())
	(func(): container.add_child(ragdoll)).call_deferred()
	var impulse_direction = Vector2.from_angle(-PI / 4)
	var impulse_vector = impulse_direction * 200
	ragdoll.apply_impulse(impulse_vector)
