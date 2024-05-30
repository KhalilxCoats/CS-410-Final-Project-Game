extends "res://Characters/Enemies/Bosses/state2.gd"


func enter():
	super.enter()
	animation_player.play("death_meleeattack")

func transition():
	if owner.direction.length() > 75:
		get_parent().change_state("Move")
