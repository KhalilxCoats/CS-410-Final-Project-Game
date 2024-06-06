#Boss Level script
#Used to play music when entering scene
#Extends Level to allow access to pause menu functions

extends Level
@onready var animation_player = $CanvasLayer2/AnimationPlayer
@onready var level = $"."

func _ready():
	pause_menu.hide()
	animation_player.play("Transition_in")
	MenuMusic.play_boss_music()
