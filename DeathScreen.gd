extends Control




func _on_button_pressed():
	get_tree().quit()
	



func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Menus/menu.tscn")


func _on_restart_pressed():
	get_tree().change_scene_to_file("res://Levels/Final_Level_1_Castlev2PSD_Night.tscn")
