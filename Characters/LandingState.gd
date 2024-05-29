extends State

class_name LandingState

@export var landing_animation_name : String = "land"
@export var elemental_landing_animation_name : String = "land"
@export var ground_state : State

#func _on_animation_tree_animation_finished(anim_name):
	#if(anim_name == landing_animation_name):
		#next_state = ground_state
		#next_state.is_elemental = false
	#
	#if(anim_name == elemental_landing_animation_name):
		#next_state = ground_state
		#next_state.is_elemental = true
