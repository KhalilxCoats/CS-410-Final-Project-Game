extends State

class_name GroundState

@export var jump_velocity : float = -200.0

@export var jump_node : String = "jump"
@export var fall_node : String = "fall"
@export var dodge_node : String = "dodge"
@export var light_attack_node : String = "attack 1"
@export var power_attack_node : String = "attack 3"
@export var special_attack_node : String = "special attack"

@export var enter_defend_node : String = "enter defend"
@export var transform_node : String = "transform"

@export var elemental_jump_node : String = "jump"
@export var elemental_fall_node : String = "fall"
@export var elemental_dodge_node : String = "dodge"
@export var elemental_light_attack_node : String = "attack 1"
@export var elemental_power_attack_node : String = "attack 3"
@export var elemental_special_attack_node : String = "special attack"

@export var elemental_transform_node : String = "transform"

#character states
@export var air_state : State
@export var attack_state: State
@export var transform_state: State
@export var dodge_state: State
@export var defend_state: State

@onready var input_timer : Timer = $TransformTimer

var start_click_left : bool = false
var start_click_right : bool = false
@export var elemental_timout : Timer

func state_process(delta):
	if(!character.is_on_floor()):
		next_state = air_state
		if !is_elemental:
			next_state.is_elemental = false
			playback.travel(fall_node)
		else:
			next_state.is_elemental = true
			playback.travel(elemental_fall_node)

func state_input(event : InputEvent):
	if!is_elemental|| elemental_timout.time_left > 1:
		if(event.is_action_pressed("jump")):
			jump()
		if(event.is_action_pressed("attack")):
			light_attack()
		if(event.is_action_pressed("power attack")):
			power_attack()
		if(event.is_action_pressed("special attack")):
			special_attack()
		if(event.is_action_pressed("dodge")):
			dodge()
		if(event.is_action_pressed("defend")):
			defend()
		
	if !is_elemental:
		if(event.is_action_pressed("transform (key)")):
			transform()
			elemental_timout.start()
	
		if(event.is_action_pressed("transform right stick") && !start_click_left):
			input_timer.start()
			start_click_left = false
			start_click_right = true
		elif(event.is_action_pressed("transform left stick") && !start_click_right):
			input_timer.start()
			start_click_left = true
			start_click_right = false
	
	if(!input_timer.is_stopped() && start_click_left == false):
		if(event.is_action_pressed("transform left stick")):
			elemental_timout.start()
			transform()
	elif(!input_timer.is_stopped() && start_click_left == true):
		if(event.is_action_pressed("transform right stick")):
			elemental_timout.start()
			transform()		
	
	if is_elemental && elemental_timout.time_left == 0 && character.is_on_floor():
		transform()

func light_attack():
	next_state = attack_state
	if !is_elemental:
		next_state.is_elemental = false
		playback.travel(light_attack_node)
	else:
		next_state.is_elemental = true
		playback.travel(elemental_light_attack_node)

func power_attack():
	next_state = attack_state
	if !is_elemental:
		next_state.is_elemental = false
		playback.travel(power_attack_node)
	else:
		next_state.is_elemental = true
		playback.travel(elemental_power_attack_node)

func special_attack():
	next_state = attack_state
	if !is_elemental:
		next_state.is_elemental = false
		playback.travel(special_attack_node)
	else:
		next_state.is_elemental = true
		playback.travel(elemental_special_attack_node)

func jump():
	character.velocity.y = jump_velocity
	next_state = air_state
	if !is_elemental:
		next_state.is_elemental = false
		playback.travel(jump_node)
	else:
		next_state.is_elemental = true
		playback.travel(elemental_jump_node)

func defend():
	if is_elemental == false:
		next_state = defend_state
		playback.travel(enter_defend_node)

func dodge():
	if is_elemental == false:
		next_state = dodge_state
		playback.travel(dodge_node)

func transform():
	next_state = transform_state
	if !is_elemental:	
		playback.travel(transform_node)
	else:
		playback.travel(elemental_transform_node)

func on_exit():
	start_click_left = false
	start_click_right = false
