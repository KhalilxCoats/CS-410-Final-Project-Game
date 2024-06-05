extends State

class_name HitState

@export var damageable: Damageable
@export var dead_state : State
@export var return_state : State


@onready var timer :Timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	damageable.connect("on_hit",on_damageable_hit)
	
func on_enter():
	timer.start()

func on_damageable_hit(node:Node,damage_amount:int):
	if(damageable.health > 0):
		emit_signal("interrupt_state", self)
		playback.travel("take hit")
	else:
		emit_signal("interrupt_state", dead_state)
		playback.travel("death")


func _on_timer_timeout():
	next_state = return_state
	playback.travel("move")
