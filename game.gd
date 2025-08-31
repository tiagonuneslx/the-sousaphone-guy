extends Node2D


func _ready() -> void:
	add_shadow($Player)


func _process(delta: float) -> void:
	pass


# --- PRIVATE FUNCTIONS ---

func add_shadow(object: Node2D) -> Shadow:
	var shadow = Shadow.create(object, $Ground)
	add_child(shadow)
	return shadow
