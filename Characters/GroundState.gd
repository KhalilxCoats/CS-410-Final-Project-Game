extends State

class_name GroundState

@export var jump_velocity : float = -200.0
@export var jump_animation : String = "jump"
@export var fall_animation : String = "fall"
@export var dodge_animation : String = "dodge"

#attack animations
@export var light_attack_animation : String = "attack 1"
@export var power_attack_animation : String = "attack 3"
@export var special_attack_animation : String = "special attack"

@export var enter_defend_animation : String = "enter defend"
@export var transform_animation : String = "transform"

#character states
@export var air_state : State
@export var attack_state: State
@export var transform_state: State
@export var dodge_state: State
@export var defend_state: State

@onready var input_timer : Timer = $TransformTimer

var start_click_left : bool = false
var start_click_right : bool = false

func state_process(delta):
	if(!character.is_on_floor()):
		next_state = air_state
		playback.travel(fall_animation)

func state_input(event : InputEvent):
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
	if(event.is_action_pressed("transform (key)")):
		transform()
	
	if(event.is_action_pressed("transform right stick") && !start_click_left):
		input_timer.start()
		start_click_left = false
		start_click_right = true
	elif(event.is_action_pressed("transform left stick") && !start_click_right):
		input_timer.start()
		start_click_left = true
		start_click_right =false
		
	
	if(!input_timer.is_stopped() && start_click_left == false):
		if(event.is_action_pressed("transform left stick")):
			transform()
	elif(!input_timer.is_stopped() && start_click_left == true):
		if(event.is_action_pressed("transform right stick")):
			transform()

func start_left():
	pass

func light_attack():
	next_state = attack_state
	playback.travel(light_attack_animation)
	
func power_attack():
	next_state = attack_state
	playback.travel(power_attack_animation)

func special_attack():
	next_state = attack_state
	playback.travel(special_attack_animation)

func jump():
	character.velocity.y = jump_velocity
	next_state = air_state
	playback.travel(jump_animation)

func defend():
	next_state = defend_state
	playback.travel(enter_defend_animation)

func dodge():
	next_state = dodge_state
	playback.travel(dodge_animation)

func transform():
		next_state = transform_state
		playback.travel(transform_animation)
