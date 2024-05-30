extends StateMachine


func enter():
	super.enter()
	animation_player.play("death_spell")
	print("test")
	await animation_player.animation_finished
	

func transition():
	if owner.direction.length() < 150:
		get_parent().change_state("Move")
