extends StateMachine

func enter():
	super.enter()
	animation_player.play("death_death")
	await animation_player.animation_finished
	print("test")
	get_parent().get_parent().queue_free()
	
