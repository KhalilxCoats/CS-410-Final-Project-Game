extends State

@export var attack_state : State
@export var attack_cooldown_timer : Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_navigation_agent_2d_navigation_finished():
	if attack_cooldown_timer.time_left == 0:
		emit_signal("interrupt_state", attack_state)
		playback.travel("attack")
