extends StateMachine
#Variables
#One is a packed scene which contains the spell scene
var can_transition: bool = false
@export var spell_node: PackedScene
#When this state is entered the spell attack animation is played then the cast function is called
func enter():
	super.enter()
	animation_player.play("death_spell")
	await animation_player.animation_finished
	cast()
	can_transition = true
#creates new spell node which makes the spell attack
func cast():
	var spell = spell_node.instantiate()
	get_tree().current_scene.add_child(spell)
#Transitions back to move
func transition():
	if can_transition:
		can_transition = false
		get_parent().change_state("Move")
