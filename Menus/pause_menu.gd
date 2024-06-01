extends Control

@onready var Level = $"../../"


#When resume is pressed game engine is resumed
func _on_resume_pressed():
	Level.pauseMenu()

#When quit game engine resumes and changes scene to main menu
func _on_quit_pressed():
	Level.pauseMenu()
	get_tree().change_scene_to_file("res://Menus/menu.tscn")
	
