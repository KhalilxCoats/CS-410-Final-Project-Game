extends State

class_name GroundState
#velocity.y = jump_velocity

@export var jump_velocity : float = -200.0
@export var air_state : State
@export var jump_animation : String = "jump"
@export var attack_state: State
@export var light_attack_animation : String = "attack 1"
@export var power_attack_animation : String = "attack 3"
@export var special_attack_animation : String = "special attack"

func state_process(delta):
	if(!character.is_on_floor()):
		next_state = air_state

func state_input(event : InputEvent):
	if(event.is_action_pressed("jump")):
		jump()
	if(event.is_action_pressed("attack")):
		light_attack()
	if(event.is_action_pressed("power attack")):
		power_attack()
	if(event.is_action_pressed("special attack")):
		special_attack()
	
	
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
