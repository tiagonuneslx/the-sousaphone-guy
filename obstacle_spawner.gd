extends Node2D
class_name ObstacleSpawner

@export var spawn_x = 800
@export var spawn_y_min = 60
@export var spawn_y_max = 320
@export var obstacle_scenes: Array[PackedScene]

@onready var spawn_timer: Timer = $SpawnTimer
@onready var obstacles_container: Node2D = $ObstaclesContainer


func start_spawning():
	spawn_timer.start()


func stop_spawning():
	spawn_timer.stop()


func clear_obstacles():
	for child in obstacles_container.get_children():
		child.queue_free()


func _on_spawn_timer_timeout() -> void:
	var random_index = randi() % obstacle_scenes.size()
	var spawn_y = randi() % (spawn_y_max - spawn_y_min) + spawn_y_min
	var obstacle_to_spawn = obstacle_scenes[random_index]
	var new_obstacle: Node2D = obstacle_to_spawn.instantiate()
	new_obstacle.global_position = Vector2(spawn_x, spawn_y)
	obstacles_container.add_child(new_obstacle)
