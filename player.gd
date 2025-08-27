extends RigidBody2D


@export var jump_force := 40000000

func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
		
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		apply_central_force(Vector2.UP * jump_force * delta)
		print("delta: " + str(delta))
		print("apply_central_forcedelta: " + str(Vector2.UP * jump_force * delta))
