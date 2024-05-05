extends State

@export var return_state : State
@export var return_node : String = "attack 1 return"
@export var return_to_move : String = "move"
@export var attack1_name : String = "attack 1"
@export var attack2_name : String = "attack 2"
@export var attack3_name : String = "attack 3"
@export var special_attack_name : String = "special attack"
@export var attack2_node : String = "attack 2"
@onready var timer : Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func state_input(event : InputEvent):
	if(event.is_action_pressed("attack")):
		timer.start()
		

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == attack1_name):
		if(timer.is_stopped()):
			next_state = return_state
			playback.travel(return_node)
		else:
			playback.travel(attack2_node)
	
	if(anim_name == attack2_name):
		next_state = return_state
		playback.travel(return_to_move)
	
	if(anim_name == attack3_name):
		next_state = return_state
		playback.travel(return_to_move)
	
	if(anim_name == special_attack_name):
		next_state = return_state
		playback.travel(return_to_move)
