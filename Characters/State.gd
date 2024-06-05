extends Node

class_name State

@export var can_move : bool = true
@export var can_fall : bool = true
@export var can_flip : bool = true
@export var different_speed : bool = false
var is_elemental : bool = false;

var character :CharacterBody2D
var playback : AnimationNodeStateMachinePlayback
var next_state : State

signal interrupt_state(new_state : State)

func state_process(delta):
	pass

func state_input(event : InputEvent):
	pass

func on_enter():
	pass
	
func on_exit():
	pass
