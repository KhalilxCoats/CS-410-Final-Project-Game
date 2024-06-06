#Script for options menu

extends Control
#Variable for the master bus
var master_bus = AudioServer.get_bus_index("Master")


#Button to return to main menu
func _on_return_to_main_menu_pressed():
	get_tree().change_scene_to_file("res://Menus/menu.tscn")

#Function to change volume based on slider value
func _on_volume_slider_value_changed(value):
	AudioServer.set_bus_volume_db(master_bus, value)
	
	if value == -30:
		AudioServer.set_bus_mute(master_bus,true)
	else:
		AudioServer.set_bus_mute(master_bus,false)
