extends Area2D

@onready var animation_player = $AnimationPlayer
@onready var player = get_parent().find_child("playerCharacter")

func _ready():
	position = player.position
	position.y -= 68
	animation_player.play("Spell")
	await animation_player.animation_finished
	queue_free()
