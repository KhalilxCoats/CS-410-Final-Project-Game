extends State

class_name TransformState

@export var ground_state : State
@export var transform_animation : String = "transform"

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == transform_animation):
		next_state = ground_state
