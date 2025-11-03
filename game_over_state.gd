extends GameState
class_name GameOverState

const KEY = "GameOver"

func _init() -> void:
	key = KEY

func enter() -> void:
	print_debug(get_parent().name + "." + KEY + ".enter()")
	game.gui.best_distance_label.text = "Best: " + str(game.best_score) + "m"
	game.gui.game_ovel_control_group.visible = true

func exit() -> void:
	game.gui.game_ovel_control_group.visible = false

func process(_delta: float) -> void:
	if Input.is_action_just_pressed("start"):
		restart_game()

func physics_process(_delta: float) -> void:
	pass

func restart_game() -> void:
	transition.emit(self, PlayState.KEY)

func _on_restart_button_pressed() -> void:
	restart_game()
