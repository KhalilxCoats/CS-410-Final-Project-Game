extends State

@export var walk_state :State
@export var attack_cooldown_timer : Timer
@export var state_machine : CharacterStateMachine

#After finishing attack move to walk state
func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == "attack"):
		print("attack done")
		next_state = walk_state
		playback.travel("move")

func _on_animation_tree_animation_started(anim_name):
	if(anim_name == "attack"):
		$WindupTimer.start()
