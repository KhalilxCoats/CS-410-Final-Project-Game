extends Control

@onready var Level = $"../../"


#Hiding menu upon entering scene
func _ready():
	hide()

#Quitting game
func _on_quit_pressed():
	get_tree().quit()

#Return to main menu
func _on_returntomenu_pressed():
	get_tree().change_scene_to_file("res://Menus/menu.tscn")

#reload current scene 
func _on_retry_pressed():
	get_tree().reload_current_scene()
