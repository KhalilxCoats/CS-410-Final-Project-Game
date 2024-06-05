extends State

@export var walk_state :State
@export var attack_state: State
@export var attack_cooldown_timer : Timer
@export var state_machine : CharacterStateMachine

func _on_navigation_agent_2d_navigation_finished():
	next_state = attack_state
	attack_cooldown_timer.start()
	playback.travel("attack")

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == "attack"):
		next_state = walk_state
		playback.travel("move")



