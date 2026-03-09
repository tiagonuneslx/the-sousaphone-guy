extends Node2D
class_name KitchenRollObstacle

@export var base_speed := 260.0

func _ready() -> void:
	$RagdollSpawner.setup($Sprite2D, $Hitbox/CollisionShape2D)


func _process(delta: float) -> void:
	rotate(-4*PI * delta)
	var velocity := Vector2.LEFT * (base_speed + Global.get_game().scroll_speed * 1.2)
	position += velocity * delta


func _on_hitbox_hit(_hurtbox: Hurtbox) -> void:
	$RagdollSpawner.spawn_ragdoll()
	$Despawner.despawn()
