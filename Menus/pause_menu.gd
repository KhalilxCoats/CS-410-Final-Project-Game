extends Control

@onready var Level = $"../../"



func _on_resume_pressed():
	Level.pauseMenu()


func _on_quit_pressed():
	Level.pauseMenu()
	get_tree().change_scene_to_file("res://Menus/menu.tscn")
	
