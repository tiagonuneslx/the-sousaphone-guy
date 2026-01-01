extends Node2D
class_name FryingPanObstacle


@export var base_speed := 260.0


func _process(delta: float) -> void:
	rotate(-2*PI * delta)
	var velocity := Vector2.LEFT * (base_speed + Global.get_game().scroll_speed * 1.2)
	position += velocity * delta


func _on_hitbox_hit(_hurtbox: Hurtbox) -> void:
	$RagdollSpawner.spawn_ragdoll()
	$Despawner.despawn()
