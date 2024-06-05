extends CharacterBody2D
class_name Character

signal healthChanged

@export var maxHealth = 30
@export var human_speed: float = 250.0
@export var elemental_speed: float = 300.0
@export var dodge_speed : float = 350

@onready var facing = 1

@onready var sprite : Sprite2D = $Sprite2D
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine
@onready var currentHealth: int = maxHealth
@onready var Elemental_timeout : Timer = $ElementalTimer

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2 = Vector2.ZERO

func _ready():
	animation_tree.active = true;
	update_health();

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor() && state_machine.get_can_fall():
		velocity.y += gravity * delta
	elif state_machine.current_state.name == "Attack":
		velocity.y = 0

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("left", "right","up","down")
	
	if (direction.x != 0 && state_machine.get_can_move() && state_machine.current_state.name != "Dodge" && !state_machine.current_state.is_elemental):
		velocity.x = direction.x * human_speed
	elif(!state_machine.current_state.is_elemental && state_machine.current_state.name == "Dodge"):
		if facing == 1:
			if state_machine.current_state.different_speed == true:
				velocity.x = dodge_speed
		elif facing == -1:
			if state_machine.current_state.different_speed == true:
				velocity.x = -dodge_speed
	elif (direction.x != 0 && state_machine.get_can_move() && state_machine.current_state.is_elemental):
		velocity.x = direction.x * elemental_speed
	else:
		velocity.x = move_toward(velocity.x, 0, human_speed)
	
	move_and_slide()
	change_animation()
	
	if(state_machine.current_state.can_flip == true):
		update_facing()
	
func change_animation():
	animation_tree.set("parameters/human move/blend_position",velocity.x)
	animation_tree.set("parameters/elemental move/blend_position",velocity.x)

func update_facing():
	if direction.x > 0 && facing == -1:
		scale.x = -1
		facing = 1
	elif direction.x < 0 && facing == 1:
		scale.x = -1
		facing = -1

func update_health():
	healthChanged.emit()
