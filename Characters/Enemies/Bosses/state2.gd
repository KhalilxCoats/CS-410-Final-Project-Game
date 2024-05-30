extends Node2D

class_name StateMachine

@onready var debug = $"../../debug"
@onready var animation_player = $"../../AnimationPlayer"
@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("playerCharacter")


func _ready():
	set_physics_process(false)

func enter():
	set_physics_process(true)

func exit():
	set_physics_process(false)

func transition():
	pass

func _physics_process(delta):
	transition()
	debug.text = name
