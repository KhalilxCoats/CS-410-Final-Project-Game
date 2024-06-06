#Damageable script for boss

extends Damageable_enemy
#Sets health on ready of this scene
func _ready():
	set_health()
	print(health)
#Health setter
func set_health():
	health = 100
#When death animation, changing to death screen
func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == "death"):
		get_parent().queue_free()
		get_tree().change_scene_to_file("res://Menus/end_screen.tscn")
