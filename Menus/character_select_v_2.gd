extends Control
#Hiding all sprites upon entering this scene
func _on_tree_entered():
	get_node("FireKnight/FireKnightSprite").hide()
	get_node("GroundMonk/GroundMonkSprite").hide()
	get_node("LightningRonin/LightningRoninSprite").hide()
	get_node("WaterPreistess/WaterPreistessSprite").hide()
	get_node("WindHashashin/WindHashashinSprite").hide()

#Showing Sprite upon hoving button
func _on_fire_knight_mouse_entered():
	get_node("FireKnight/FireKnightSprite").show()
	

func _on_fire_knight_mouse_exited():
	get_node("FireKnight/FireKnightSprite").hide()


func _on_return_to_main_pressed():
	get_tree().change_scene_to_file("res://Menus/menu.tscn")


func _on_fire_knight_pressed():
	get_tree().change_scene_to_file("res://Levels/level.tscn")

#Showing Sprite upon hoving button
func _on_ground_monk_mouse_entered():
	get_node("GroundMonk/GroundMonkSprite").show()
	


func _on_ground_monk_mouse_exited():
	get_node("GroundMonk/GroundMonkSprite").hide()

#Showing Sprite upon hoving button
func _on_lightning_ronin_mouse_entered():
	get_node("LightningRonin/LightningRoninSprite").show()


func _on_lightning_ronin_mouse_exited():
	get_node("LightningRonin/LightningRoninSprite").hide()

#Showing Sprite upon hoving button
func _on_water_preistess_mouse_entered():
	get_node("WaterPreistess/WaterPreistessSprite").show()


func _on_water_preistess_mouse_exited():
	get_node("WaterPreistess/WaterPreistessSprite").hide()

#Showing Sprite upon hoving button
func _on_wind_hashashin_mouse_entered():
	get_node("WindHashashin/WindHashashinSprite").show()


func _on_wind_hashashin_mouse_exited():
	get_node("WindHashashin/WindHashashinSprite").hide()
