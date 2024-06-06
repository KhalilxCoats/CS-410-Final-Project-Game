extends Area2D

#Damage from this attack
@export var damage : float = 5
var player_state_machine: CharacterStateMachine

#When something enters body, check if damageable and if is damage
func _on_body_entered(body):
	print("hit")
	for child in body.get_children():
		if child is Damageable_player:
			child.hit(damage)
