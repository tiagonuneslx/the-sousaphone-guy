extends Node

func get_game() -> Game:
	return get_tree().current_scene as Game
