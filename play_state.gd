extends GameState
class_name PlayState

const KEY = "Play"

var distance_px: float
var base_scroll_speed := 140.0
var scroll_speed: float
var score: int

func _init() -> void:
	key = KEY

func enter() -> void:
	print_debug(get_parent().name + "." + KEY + ".enter()")
	game.background.scroll_offset.x = 0
	distance_px = 0
	scroll_speed = base_scroll_speed
	score = 0
	game.obstacle_spawner.clear_obstacles()
	game.obstacle_spawner.start_spawning()
	game.player.can_jump = true

func exit() -> void:
	if score > game.best_score:
		game.best_score = score
	game.background.scroll_speed = 0
	game.obstacle_spawner.stop_spawning()
	game.player.can_jump = false

func process(_delta: float) -> void:
	distance_px = abs(game.background.scroll_offset.x)
	scroll_speed = base_scroll_speed + pow(5*distance_px, .5)
	game.background.scroll_speed = scroll_speed
	var distance_meters = distance_px * 5.0/16.0
	score = int(round(distance_meters))
	game.gui.distance_label.text = str(score) + "m"
	if(OS.has_feature('debug')):
		game.gui.debug_control_group.speed_label.text = "Speed: " + str(snapped(scroll_speed * 5.0/16.0, 2)) + "m/s"


func physics_process(_delta: float) -> void:
	pass


func _on_player_die() -> void:
	print_debug("The Sousaphone Guy died :(")
	transition.emit(self, GameOverState.KEY)
