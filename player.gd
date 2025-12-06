extends RigidBody2D
class_name Player

signal die

@onready var shadow: Shadow = $Shadow

var jump_force := 200_000.0
var max_speed := 600.0
var can_jump := false


func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if can_jump:
		jump_on_left_click(state)
	cap_velocity(state)


# --- PRIVATE FUNCTIONS ---

func jump_on_left_click(state: PhysicsDirectBodyState2D):
	if Input.is_action_pressed("jump"):
		state.apply_force(Vector2.UP * jump_force)


func cap_velocity(state: PhysicsDirectBodyState2D):
	if state.linear_velocity.length() > max_speed:
		state.linear_velocity = state.linear_velocity.normalized() * max_speed


func _on_hurtbox_hit(_hitbox: Hitbox) -> void:
	die.emit()
