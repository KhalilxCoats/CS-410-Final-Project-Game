extends Control

@onready var Level = $"../../"


#When resume is pressed game engine is resumed
func _ready():
	hide()

#When quit game engine resumes and changes scene to main menu
func _on_quit_pressed():
	get_tree().quit()


func _on_returntomenu_pressed():
	get_tree().change_scene_to_file("res://Menus/menu.tscn")


func _on_retry_pressed():
	get_tree().reload_current_scene()
