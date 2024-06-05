extends Area2D

@export var damage : float = 2.5

func _on_body_entered(body):
	print("hit")
	for child in body.get_children():
		if child is Damageable_enemy:
			child.hit(damage)
