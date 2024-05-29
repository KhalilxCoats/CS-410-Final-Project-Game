extends State

class_name AirState

@export var attack_state: State
@export var ground_state: State

@export var move_node : String = "human move"
@export var landing_node : String = "land"
@export var air_attack_node : String = "air attack 1"

@export var elemental_move_node : String = "air attack 1"
@export var elemental_landing_node : String = "land"
@export var elemental_air_attack_node : String = "air attack 1"


func state_process(delta):
	if(character.is_on_floor()):
			next_state = ground_state

func state_input(event : InputEvent):
	if(event.is_action_pressed("attack")):
		air_attack()

func air_attack():
	next_state = attack_state
	if !is_elemental:
		next_state.is_elemental = false
		playback.travel(air_attack_node)
	else:
		next_state.is_elemental = false
		playback.travel(elemental_air_attack_node)

func on_exit():		
	if(next_state == ground_state):
		if !is_elemental && character.velocity.x != 0:
			next_state.is_elemental = false
			playback.travel(move_node)
		elif !is_elemental && character.velocity.x == 0:
			next_state.is_elemental = false
			playback.travel(landing_node)
		elif is_elemental && character.velocity.x != 0:
			next_state.is_elemental = true
			playback.travel(elemental_move_node)
		else:
			next_state.is_elemental = true
			playback.travel(elemental_landing_node)
