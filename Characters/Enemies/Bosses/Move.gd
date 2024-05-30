extends "res://Characters/Enemies/Bosses/state2.gd"

@onready var timer = $SpellAttackTimer
@onready var timer2 = $"../Attack/AttackTimer"
# Called when the node enters the scene tree for the first time.
func enter():
	super.enter()
	owner.set_physics_process(true)
	timer.start()
	timer2.start()
	animation_player.play("death_move")

func exit():
	super.exit()
	owner.set_physics_process(false)
	
func transition():
	var distance = owner.direction.length()
	
	if distance < 75 && timer2.is_stopped():
		get_parent().change_state("Attack")
	elif distance > 160 && timer.is_stopped():
		get_parent().change_state("RangeAttack")



