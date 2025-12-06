extends Node2D
class_name Game

@onready var background: Background = $Background
@onready var player: Player = $Player
@onready var background_music: AudioStreamPlayer = $BackgroundMusic
@onready var gui: GUICanvasLayer = $GUICanvasLayer
@onready var obstacle_spawner: ObstacleSpawner = $ObstacleSpawner
@onready var game_sate_machine: StateMachine = $GameStateMachine
@onready var ground: Node2D = $Ground
@onready var ceiling: Node2D = $Ceiling

var best_score: int = 0

func _ready() -> void:
	if(OS.has_feature('debug')):
		$BackgroundMusic.volume_db = -30
	else:
		$GUI/Debug.queue_free()
	
	game_sate_machine.start()
