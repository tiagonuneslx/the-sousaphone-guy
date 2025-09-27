class_name Shadow
extends Node2D

@export var ground: Node2D

@export var base_radius := DEFAULT_BASE_RADIUS
var base_alpha := 0.1
var max_jump_height := 400

var _radius := 0.0
var _alpha := 0.0


func _process(_delta):
	calculate_radius_and_alpha()
	update_position()
	queue_redraw()


func _draw():
	if _radius > 0 && _alpha > 0:
		draw_ellipsis()


# --- PRIVATE FUNCTIONS ---

func calculate_radius_and_alpha():
	var current_height = ground.global_position.y - get_parent().global_position.y
	var jump_progress = clamp(current_height / max_jump_height, 0.0, 1.0)
	_radius = base_radius * (1.0 - 1.4 * jump_progress)
	_alpha = base_alpha * (1.0 - 2 * jump_progress)


func update_position():
	global_position = Vector2(get_parent().global_position.x, ground.global_position.y)


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
