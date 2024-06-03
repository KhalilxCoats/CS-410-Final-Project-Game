extends "res://Characters/Enemies/Bosses/state2.gd"

@onready var timer = $SpellAttackTimer
@onready var timer2 = $"../Attack/AttackTimer"
# Called when the node enters the scene tree for the first time.
#2 timers to have a cooldown for attack and spell attack
func enter():
	super.enter()
	owner.set_physics_process(true)
	timer.start()
	timer2.start()
	animation_player.play("death_move")

func exit():
	super.exit()
	owner.set_physics_process(false)
	
#When the distance from the player is less thahn 75 units and timer2 is stopped
#Then the boss will transition into MeleeAttack state
#If distance from player is above 160 units then the range attack will start
func transition():
	var distance = owner.direction.length()
	print(distance)
	
	if distance < 95 && timer2.is_stopped():
		get_parent().change_state("Attack")
	elif distance > 160 && timer.is_stopped():
		get_parent().change_state("RangeAttack")



