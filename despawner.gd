extends Node

func despawn():
	print_debug(get_parent().name + ".despawn()")
	get_parent().queue_free()
