#Script for level 2
extends Level
#Setting variables up ready
@onready var animation_player = $FadeLayer/AnimationPlayer
@onready var portal_player = $PortalPlayer
@onready var level = $"."
@onready var Health = $CanvasLayer/Character_Health
#Play animation upon ready
func _ready():
	animation_player.play("Transition_in")
	Health.max_value = find_child("playerCharacter").find_child("Damageable").health
func _physics_process(delta):
	update_health()
#Upon entering next level area, transition to boss level
func _on_next_level_body_entered(body):
	if body.is_in_group("playerCharacter"):
		portal_player.play("Portal_Enter")
		await portal_player.animation_finished
		animation_player.play("Transition_out")
		await animation_player.animation_finished
		get_tree().change_scene_to_file("res://Levels/boss_level.tscn")

#Upon entering kill box, show death screen
func _on_kill_box_body_entered(body):
	if body.is_in_group("playerCharacter"):
		animation_player.play("Transition_out")
		await animation_player.animation_finished
		level.deathMenu()  

func update_health():
	Health.value = find_child("playerCharacter").find_child("Damageable").health
