#Boss Level script
#Used to play music when entering scene
#Extends Level to allow access to pause menu functions

extends Level

func _ready():
	pause_menu.hide()
	MenuMusic.play_boss_music()
