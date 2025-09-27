extends Area2D
class_name Hurtbox

signal hit(hitbox: Hitbox)

func _on_area_entered(area: Area2D) -> void:
	if area is Hitbox:
		var hitbox: Hitbox = area
		hitbox.on_hit(self)
		hit.emit(hitbox)
		print_debug(get_parent().name + ".hit("+ hitbox.get_parent().name + ")")
