extends Node2D

var distance_px := 0
var base_scroll_speed := 140.0
var scroll_speed: float


func _ready() -> void:
	add_shadow($Player)


func _process(delta: float) -> void:
	distance_px = abs($Background.scroll_offset.x)
	scroll_speed = base_scroll_speed + pow(5*distance_px, .5)
	$Background.scroll_speed = scroll_speed
	var distance_meters = distance_px * 5.0/16.0
	$GUI/Distance.text = str(int(round(distance_meters))) + "m"
	$GUI/Speed.text = "Speed: " + str(snapped(scroll_speed * 5.0/16.0, 2)) + "m/s"


# --- PRIVATE FUNCTIONS ---

func add_shadow(object: Node2D) -> Shadow:
	var shadow = Shadow.create(object, $Ground)
	add_child(shadow)
	return shadow
