extends Node
class_name Damageable_player

@export var state_machine : CharacterStateMachine

signal on_hit(node: Node, damage_taken: float)
@export var health : float = 20 :
	get:
		return health
	set(value):
		SignalBus.emit_signal("on_health_changed",get_parent(), value - health)
		health = value

func hit(damage : float):
	if(!state_machine.current_state.is_elemental):
		if(state_machine.current_state.name != "Defend" && state_machine.current_state.name != "Dodge"):
			health -= damage
			emit_signal("on_hit", get_parent(), damage)
		elif state_machine.current_state.name != "Defend":
			health -= damage / 5
			emit_signal("on_hit", get_parent(), damage / 5)
		elif state_machine.current_state.name == "Dodge":
			pass


func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == "Human_death"):
		get_parent().queue_free()
