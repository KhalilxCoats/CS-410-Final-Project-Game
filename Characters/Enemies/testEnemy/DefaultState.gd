extends State

@export var attack_state: State
@export var attack_animation: String = "Attack"
@onready var nav: NavigationAgent2D = get_parent().get_parent().get_node("NavigationAgent2D")
@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("playerCharacter")
@onready var parentCharacter: CharacterBody2D = get_parent().get_parent()
@export var speed = 100
@onready var sprite : Sprite2D = get_parent().get_parent().get_node("Sprite2D")
@onready var facing = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func state_process(delta):
	nav.target_position = player.get_global_position()
	nav.target_position.y -= 10 #makes the enemy aim slightly higher
	var direction = nav.get_next_path_position() - parentCharacter.get_global_position() #get difference between current position and next position
	direction = direction.normalized() #convert difference into normal vectors
	parentCharacter.velocity = direction * speed
	parentCharacter.move_and_slide()
	if direction.x > 0 && facing == -1:
		parentCharacter.scale.x = -1
		facing = 1
	elif direction.x < 0 && facing == 1:
		parentCharacter.scale.x = -1
		facing = -1
	
func attack():
	next_state = attack_state
	playback.travel(attack_animation)
