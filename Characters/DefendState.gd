extends State

class_name DefendState

@export var return_to_move : String = "move"
@export var ground_state : State

func state_input(event : InputEvent):
	if(event.is_action_pressed("defend")):
		playback.travel("defend")

	if(event.is_action_released("defend")):
		playback.travel("exit defend")

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == "exit defend"):
		next_state = ground_state
		playback.travel(return_to_move)
