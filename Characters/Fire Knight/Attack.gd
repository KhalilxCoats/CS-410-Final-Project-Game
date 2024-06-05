extends State

@export var ground_state : State
@export var air_state : State

@export var attack1_name : String = "attack 1"
@export var attack2_name : String = "attack 2"
@export var attack3_name : String = "attack 3"
@export var air_attack_name : String = "air attack 1"
@export var air_attack2_name : String = "air attack 2"
@export var special_attack_name : String = "special attack"
@export var attack_return_name : String = "attack 1 return"

@export var elemental_attack1_name : String = "attack 1"
@export var elemental_attack2_name : String = "attack 2"
@export var elemental_attack3_name : String = "attack 3"
@export var elemental_air_attack_name : String = "air attack 1"
@export var elemental_air_attack2_name : String = "air attack 2"
@export var elemental_special_attack_name : String = "special attack"
@export var elemental_attack_return_name : String = "attack 1 return"

@export var return_node : String = "attack 1 return"
@export var air_return_node : String = "fall"
@export var return_to_move : String = "move"
@export var attack2_node : String = "attack 2"
@export var air_attack2_node : String = "air attack 2"

@export var elemental_return_node : String = "attack 1 return"
@export var elemental_air_return_node : String = "fall"
@export var elemental_return_to_move : String = "move"
@export var elemental_attack2_node : String = "attack 2"
@export var elemental_air_attack2_node : String = "air attack 2"

@onready var timer : Timer = $AttackTimer
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
			playback.travel(return_node)
		else:
			playback.travel(attack2_node)
	
	if(anim_name == attack_return_name):
		next_state = ground_state
		next_state.is_elemental = false
		playback.travel(return_to_move)
	
	if(anim_name == attack2_name):
		next_state = ground_state
		next_state.is_elemental = false
		playback.travel(return_to_move)
	
	if(anim_name == attack3_name):
		next_state = ground_state
		next_state.is_elemental = false
		playback.travel(return_to_move)
	
	if(anim_name == special_attack_name):
		next_state = ground_state
		next_state.is_elemental = false
		playback.travel(return_to_move)
	
	if(anim_name == air_attack_name):
		if(timer.is_stopped()):
			next_state = air_state
			next_state.is_elemental = false
			playback.travel(air_return_node)
		else:
			playback.travel(air_attack2_node)
	
	if(anim_name == air_attack2_name):
		next_state = air_state
		next_state.is_elemental = false
		playback.travel(air_return_node)
		
	#elementals start here
	if(anim_name == elemental_attack1_name):
		if(timer.is_stopped()):
			playback.travel(elemental_return_node)
		else:
			playback.travel(elemental_attack2_node)
	
	if(anim_name == elemental_attack_return_name):
		next_state = ground_state
		next_state.is_elemental = true
		playback.travel(elemental_return_to_move)
	
	if(anim_name == elemental_attack2_name):
		next_state = ground_state
		next_state.is_elemental = true
		playback.travel(elemental_return_to_move)
	
	if(anim_name == elemental_attack3_name):
		next_state = ground_state
		next_state.is_elemental = true
		playback.travel(elemental_return_to_move)
	
	if(anim_name == elemental_special_attack_name):
		next_state = ground_state
		next_state.is_elemental = true
		playback.travel(elemental_return_to_move)
	
	if(anim_name == elemental_air_attack_name):
		if(timer.is_stopped()):
			next_state = air_state
			next_state.is_elemental = true
			playback.travel(elemental_air_return_node)
		else:
			playback.travel(elemental_air_attack2_node)
	
	if(anim_name == elemental_air_attack2_name):
		next_state = air_state
		next_state.is_elemental = true
		playback.travel(elemental_air_return_node)
