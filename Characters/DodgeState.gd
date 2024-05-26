extends State

class_name DodgeState

@export var return_to_move : String = "move"
@export var dodge_animation : String = "dodge"
@export var ground_state : State

func on_enter():
	diferent_speed = true

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == dodge_animation):
		diferent_speed = false
		next_state = ground_state
		playback.travel(return_to_move)
