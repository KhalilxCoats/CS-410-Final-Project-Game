extends Damageable_enemy


func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == "death"):
		get_parent().queue_free()
		get_tree().change_scene_to_file("res://Menus/end_screen.tscn")
