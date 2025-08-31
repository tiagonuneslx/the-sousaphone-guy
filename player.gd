extends RigidBody2D


var jump_force := 200_000.0
var max_speed := 600.0


func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	jump_on_left_click(state)
	cap_velocity(state)


# --- PRIVATE FUNCTIONS ---

func jump_on_left_click(state: PhysicsDirectBodyState2D):
	if Input.is_action_pressed("jump"):
		state.apply_force(Vector2.UP * jump_force)


func cap_velocity(state: PhysicsDirectBodyState2D):
	if state.linear_velocity.length() > max_speed:
		state.linear_velocity = state.linear_velocity.normalized() * max_speed
