extends Node2D
class_name RagdollSpawner

@export_custom(PROPERTY_HINT_NONE, "suffix:kg")
var inertia: float = 0.0
@export_custom(PROPERTY_HINT_NONE, "suffix:kg")
var mass: float = 1.0
@export
var impulse_magnitude: float = 300

var sprite: Sprite2D
var collision_shape: CollisionShape2D
var collision_polygon: CollisionPolygon2D


func setup(p_sprite: Sprite2D, p_collision_shape: CollisionShape2D) -> void:
	sprite = p_sprite
	collision_shape = p_collision_shape


func setup_with_polygon(p_sprite: Sprite2D, p_collision_polygon: CollisionPolygon2D) -> void:
	sprite = p_sprite
	collision_polygon = p_collision_polygon


func spawn_ragdoll() -> void:
	print_debug(get_parent().name + ".spawn_ragdoll()")
	var container: Node2D = Global.get_game().obstacle_spawner.obstacles_container
	var ragdoll = RigidBody2D.new()
	ragdoll.collision_layer = 0
	ragdoll.collision_mask = 0
	ragdoll.inertia = inertia
	ragdoll.mass = mass
	ragdoll.set_collision_mask_value(1, true)
	ragdoll.global_position = get_parent().global_position
	ragdoll.z_index = get_parent().z_index
	ragdoll.global_rotation = get_parent().global_rotation
	var shadow = Shadow.new()
	ragdoll.add_child(shadow)
	ragdoll.add_child(sprite.duplicate())
	if(collision_shape != null):
		ragdoll.add_child(collision_shape.duplicate())
	if(collision_polygon != null):
		ragdoll.add_child(collision_polygon.duplicate())
	(func(): container.add_child(ragdoll)).call_deferred()
	var impulse_direction = Vector2.from_angle(-PI / 3)
	var impulse_vector = impulse_direction * impulse_magnitude
	ragdoll.apply_impulse(impulse_vector, Vector2(-8, 0))
