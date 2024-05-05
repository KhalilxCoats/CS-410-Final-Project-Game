extends Control




func _on_volume_pressed():
	pass # Replace with function body.


func _on_return_to_main_menu_pressed():
	get_tree().change_scene_to_file("res://Menus/menu.tscn")


func _on_quit_pressed():
	get_tree().quit()
