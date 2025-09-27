extends ParallaxBackground
class_name Background


var scroll_speed: float


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	scroll_offset.x -= scroll_speed * delta
