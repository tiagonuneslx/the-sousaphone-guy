extends Node2D
class_name FryingPanObstacle

@onready var sprite: Sprite2D = $Sprite2D
@onready var collision_shape: CollisionShape2D = $Hitbox/CollisionShape2D
@onready var ragdoll_spawner: RagdollSpawner = $RagdollSpawner

@export var base_speed := 260.0

func _ready() -> void:
	ragdoll_spawner.setup(sprite, collision_shape)


func _process(delta: float) -> void:
	rotate(-2*PI * delta)
	var velocity := Vector2.LEFT * (base_speed + Global.get_game().scroll_speed * 1.2)
	position += velocity * delta


func _on_hitbox_hit(_hurtbox: Hurtbox) -> void:
	$RagdollSpawner.spawn_ragdoll()
	$Despawner.despawn()
