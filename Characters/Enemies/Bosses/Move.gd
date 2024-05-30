extends "res://Characters/Enemies/Bosses/state2.gd"


# Called when the node enters the scene tree for the first time.
func enter():
	super.enter()
	owner.set_physics_process(true)
	animation_player.play("death_move")

func exit():
	super.exit()
	owner.set_physics_process(false)
	
func transition():
	var distance = owner.direction.length()
	if distance < 75:
		get_parent().change_state("Attack")
	elif distance > 160:
		get_parent().change_state("RangeAttack")



