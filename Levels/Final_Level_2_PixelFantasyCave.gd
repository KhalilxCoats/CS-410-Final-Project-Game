#Script for level 2
extends Level
#Setting variables up ready
@onready var animation_player = $FadeLayer/AnimationPlayer
@onready var level = $"."
#Play animation upon ready
func _ready():
	animation_player.play("Transition_in")
	
#Upon entering next level area, transition to boss level
func _on_next_level_body_entered(body):
	if body.is_in_group("playerCharacter"):
		animation_player.play("Transition_out")
		await animation_player.animation_finished
		get_tree().change_scene_to_file("res://Levels/boss_level.tscn")

#Upon entering kill box, show death screen
func _on_kill_box_body_entered(body):
	if body.is_in_group("playerCharacter"):
		animation_player.play("Transition_out")
		await animation_player.animation_finished
		level.deathMenu()  
