extends StateMachine


#When entering death scene, death animation plays, thhen boss is deleted, then scene
#is changed to end screen
func enter():
	super.enter()
	animation_player.play("death_death")
	await animation_player.animation_finished
	print("test")
	get_parent().get_parent().queue_free()
	get_tree().change_scene_to_file("res://Menus/end_screen.tscn")
