#Script for level 1
extends Level

#Setting variables upon scene being ready
@onready var animation_player = $FadeLayer/AnimationPlayer
@onready var level = $"."
@onready var Health = $CanvasLayer/Character_Health
#Transitions in upon scene being ready
func _ready():
	animation_player.play("Transition_in")
	Health.max_value = find_child("playerCharacter").find_child("Damageable").health


func _physics_process(delta):
	update_health()
#Signal from area 2d "Next Level". Changes to next level after playing animation
func _on_next_level_body_entered(body):
	if body.is_in_group("playerCharacter"):
		animation_player.play("Transition_out")
		await animation_player.animation_finished
		get_tree().change_scene_to_file("res://Levels/Final_Level_2_PixelFantasyCave.tscn")

#Signal from killbox, Upon entering a kill box game over screen plays
func _on_kill_box_body_entered(body):
	if body.is_in_group("playerCharacter"):
		animation_player.play("Transition_out")
		await animation_player.animation_finished
		level.deathMenu() 
func update_health():
	Health.value = find_child("playerCharacter").find_child("Damageable").health
	
