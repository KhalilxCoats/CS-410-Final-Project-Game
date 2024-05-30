extends StateMachine

var can_transition: bool = false
@export var spell_node: PackedScene

func enter():
	super.enter()
	animation_player.play("death_spell")
	await animation_player.animation_finished
	cast()
	can_transition = true

func cast():
	var spell = spell_node.instantiate()
	get_tree().current_scene.add_child(spell)

func transition():
	if can_transition:
		can_transition = false
		get_parent().change_state("Move")
