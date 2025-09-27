extends Area2D
class_name Hitbox

signal hit(hurtbox: Hurtbox)

func on_hit(hurtbox: Hurtbox) -> void:
	print_debug(get_parent().name + ".on_hit("+ hurtbox.get_parent().name + ")")
	hit.emit(hurtbox)
