extends Node2D
class_name FryingPanObstacle

var velocity := Vector2.LEFT * 400


func _process(delta: float) -> void:
	rotate(-2*PI * delta)
	position += velocity * delta


func _on_hitbox_hit(_hurtbox: Hurtbox) -> void:
	$RagdollSpawner.spawn_ragdoll()
	$Despawner.despawn()
