#Spell script
#This script runs in tandem with boss spellattackState

extends Area2D


@onready var animation_player = $AnimationPlayer
@onready var player = get_parent().find_child("playerCharacter")
#When ready, sprite will spawn above the player and play an animation
func _ready():
	position = player.position
	position.y -= 68
	animation_player.play("Spell")
	await animation_player.animation_finished
	queue_free()


func _on_area_entered(area):
	print("Range Hit")
