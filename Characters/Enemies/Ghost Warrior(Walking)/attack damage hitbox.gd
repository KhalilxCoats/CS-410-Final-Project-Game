extends Area2D

@export var damage : float = 5
var player_state_machine: CharacterStateMachine

func _on_body_entered(body):
	print("hit")
	for child in body.get_children():
		if child is Damageable_player:
			child.hit(damage)
