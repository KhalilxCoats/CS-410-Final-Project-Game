extends State

class_name GroundState

@export var jump_velocity : float = -200.0
@export var dodge_speed : float = 1500.0
@export var jump_animation : String = "jump"
@export var fall_animation : String = "fall"
@export var dodge_animation : String = "dodge"

#attack animations
@export var light_attack_animation : String = "attack 1"
@export var power_attack_animation : String = "attack 3"
@export var special_attack_animation : String = "special attack"

@export var enter_defend_animation : String = "enter defend"

#character states
@export var air_state : State
@export var attack_state: State
@export var transform_state: State
@export var dodge_state: State
@export var defend_state: State

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
	if(event.is_action_pressed("dodge") && character.velocity.x != 0):
		dodge()
	if(event.is_action_pressed("defend")):
		defend()
	if(event.is_action_pressed("transform (key)") || (event.is_action_pressed("transform(left trigger)") && event.is_action_pressed("transform(right trigger)"))):
		transform()


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
	character.velocity.x += dodge_speed
	next_state = dodge_state
	playback.travel(dodge_animation)

func transform():
	pass
