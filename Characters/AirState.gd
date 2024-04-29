extends State

class_name AirState

@export var landing_state : State
@export var landing_animation : String = "land"

func state_process(delta):
	if(character.is_on_floor()):
		next_state = landing_state

func on_exit():
	playback.travel(landing_animation)
