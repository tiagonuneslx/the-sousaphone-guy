extends Node
class_name StateMachine

@export var game: Game
@export var initial_state: State

var current_state: State
var states := {}

func start() -> void:
	for child in get_children():
		if child is State:
			var state: State = child
			state.game = game
			states[state.key] = state
			state.transition.connect(on_transition)
	
	current_state = initial_state
	current_state.enter()
	

func _process(delta: float) -> void:
	if current_state:
		current_state.process(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_process(delta)

func on_transition(_state: State, new_state_key: String):
	var new_state = states.get(new_state_key)
	current_state.exit()
	new_state.enter()
	current_state = new_state
