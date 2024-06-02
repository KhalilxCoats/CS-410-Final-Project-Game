extends Level

@onready var animation_player = $FadeLayer/AnimationPlayer
func _ready():
	animation_player.play("Transition_in")
	

func _on_next_level_body_entered(body):
	if body.is_in_group("playerCharacter"):
		animation_player.play("Transition_out")
		await animation_player.animation_finished
		get_tree().change_scene_to_file("res://Levels/boss_level.tscn")
