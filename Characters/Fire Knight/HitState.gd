extends State

class_name player_HitState

@export var damageable: Damageable_player
@export var state_machine : CharacterStateMachine
@export var dead_state : State
@export var ground_state : State
@export var air_state : State


@onready var timer :Timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	damageable.connect("on_hit", on_damageable_hit)
	
func on_enter():
	for child in get_parent().get_parent().get_children():
		if child is Area2D:
			child.monitoring = false

func on_damageable_hit(node:Node,damage_amount:float):
	if(damageable.health > 0 && state_machine.current_state.name != "Defend" && state_machine.current_state.name != "Transform"):
		emit_signal("interrupt_state", self)
		playback.travel("Human_take hit")
	elif(damageable.health > 0 && (state_machine.current_state.name == "Defend" || state_machine.current_state.name == "Transform")):
		pass
	else:
		emit_signal("interrupt_state", dead_state)
		playback.travel("Human_death")
		await get_tree().create_timer(1.5).timeout
		get_parent().get_parent().get_parent().level.deathMenu()

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == "Human/take hit"):
		if(state_machine.current_state.name != "Dead"):
			if(character.is_on_floor()):
				next_state = ground_state
				playback.travel("human move")
			else:
				next_state = air_state
				playback.travel("fall")
