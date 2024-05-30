extends "res://Characters/Enemies/Bosses/state2.gd"
var can_transition: bool = false

func enter():
	super.enter()
	animation_player.play("death_meleeattack")
	await animation_player.animation_finished
	can_transition = true

func transition():
	if can_transition:
		can_transition = false
		get_parent().change_state("Move")
