class_name Shadow
extends Node2D

@export var base_radius := DEFAULT_BASE_RADIUS
var base_alpha := 0.1

var _radius := 0.0
var _alpha := 0.0


func _process(_delta):
	global_rotation = 0
	calculate_radius_and_alpha()
	update_position()
	queue_redraw()


func _draw():
	if _radius > 0 && _alpha > 0:
		draw_ellipsis()


# --- PRIVATE FUNCTIONS ---

func calculate_radius_and_alpha():
	var current_height = Global.get_game().ground.global_position.y - get_parent().global_position.y
	var max_height = get_window().size.y
	var height_progress = clamp(current_height / max_height, 0.0, 1.0)
	_radius = base_radius * (1.0 - 0.1 * height_progress)
	_alpha = base_alpha * (1.0 - 1.6 * height_progress)


func update_position():
	global_position = Vector2(get_parent().global_position.x, Global.get_game().ground.global_position.y)


func draw_ellipsis():
	var ellipse_color = Color(0, 0, 0, _alpha)
	var ellipse_scale = Vector2(1.0, 0.5)
	var ellipse_points = []
	var num_points = 20
	for i in range(num_points):
		var angle = float(i) * 2 * PI / num_points
		var x = cos(angle) * _radius * ellipse_scale.x
		var y = sin(angle) * _radius * ellipse_scale.y
		ellipse_points.append(Vector2(x, y))
	draw_colored_polygon(ellipse_points, ellipse_color, [], null)


# --- STATIC ---
const DEFAULT_BASE_RADIUS = 14.0
