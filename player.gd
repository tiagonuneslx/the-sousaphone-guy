extends RigidBody2D


var jump_force := 200_000.0
var max_speed := 600.0


func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		state.apply_force(Vector2.UP * jump_force)
	cap_velocity(state)


func cap_velocity(state: PhysicsDirectBodyState2D):
	if state.linear_velocity.length() > max_speed:
		state.linear_velocity = state.linear_velocity.normalized() * max_speed
