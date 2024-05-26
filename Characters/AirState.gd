extends State

class_name AirState

@export var landing_state : State
@export var attack_state: State
@export var ground_state: State
@export var landing_animation : String = "land"
@export var air_attack_animation : String = "air attack 1"


func state_process(delta):
	if(character.is_on_floor()):
		next_state = landing_state

func state_input(event : InputEvent):
	if(event.is_action_pressed("attack")):
		air_attack()

func air_attack():
	next_state = attack_state
	playback.travel(air_attack_animation)

func on_exit():
	if(next_state == landing_state):
		playback.travel(landing_animation)
	if(next_state == ground_state):
		playback.travel("move")
