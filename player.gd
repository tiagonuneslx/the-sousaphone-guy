extends RigidBody2D


var jump_force := 40000000
var max_speed = 600.0

var is_at_max_speed = false
var is_at_ceiling = false
var initial_gravity_scale = gravity_scale


func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if !is_at_ceiling:
			if !is_at_max_speed:
				apply_central_force(Vector2.UP * jump_force * delta)
		else:
			if gravity_scale > 0:
				gravity_scale = 0
				print("freeze")
	else:
		if gravity_scale < initial_gravity_scale:
			gravity_scale = initial_gravity_scale
			print("unfreeze")


func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if (state.linear_velocity * Vector2.UP).y > max_speed:
		is_at_max_speed = true
	else:
		is_at_max_speed = false


func _on_body_entered(body: Node) -> void:
	if body.name == "Ceiling":
		is_at_ceiling = true


func _on_body_exited(body: Node) -> void:
	if body.name == "Ceiling":
		is_at_ceiling = false
