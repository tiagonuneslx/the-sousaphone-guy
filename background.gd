extends ParallaxBackground


@export var scroll_speed = 140

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	scroll_offset.x -= scroll_speed * delta
