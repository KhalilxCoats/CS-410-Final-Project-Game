extends State

@export var attack_state: State
@export var attack_animation: String = "Attack"
@onready var nav: NavigationAgent2D = get_parent().get_parent().get_node("NavigationAgent2D")
@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("playerCharacter")
@onready var parentCharacter: CharacterBody2D = get_parent().get_parent()
@export var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func state_process(delta):
	nav.target_position = player.get_global_position()
	var direction = nav.get_next_path_position() - parentCharacter.get_global_position()
	direction = direction.normalized()
	parentCharacter.velocity = direction * speed
	parentCharacter.move_and_slide()
	
func attack():
	next_state = attack_state
	playback.travel(attack_animation)
