#Custome finite state machine for the boss 

extends Node2D

#Declaring states
var current_state: StateMachine
var previous_state: StateMachine

#Putting boss in idle when first starting machine
func _ready():
	current_state = get_child(0) as StateMachine
	previous_state = current_state
	current_state.enter()

#Changes state to chosen state
func change_state(state):
	current_state = find_child(state) as StateMachine
	current_state.enter()
	
	previous_state.exit()
	previous_state = current_state
	
