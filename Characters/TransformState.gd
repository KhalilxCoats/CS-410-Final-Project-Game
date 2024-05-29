extends State

class_name TransformState

@export var elemental_timeout : Timer
@export var ground_state : State
@export var elemental_transform_animation : String = "Human/transform"
@export var human_transform_animation : String = "Elemental/transform"
@export var elemental_move_node : String = "transform"
@export var human_move_node : String = "transform"

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == elemental_transform_animation):
		next_state = ground_state
		next_state.is_elemental = true
		playback.travel(elemental_move_node)
	elif(anim_name == human_transform_animation):
		next_state = ground_state
		next_state.is_elemental = false
		playback.travel(human_move_node)
