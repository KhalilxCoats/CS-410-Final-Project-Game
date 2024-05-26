extends CharacterBody2D
class_name Character

signal healthChanged

@export var maxHealth = 30
@export var speed: float = 200.0
@export var dodge_speed : float = 350

@onready var sprite : Sprite2D = $Sprite2D

@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine
@onready var currentHealth: int = maxHealth

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
	
	if (direction.x != 0 && state_machine.get_can_move() && state_machine.current_state.name != "Dodge"):
		velocity.x = direction.x * speed
	elif(state_machine.current_state.name == "Dodge"):
		if sprite.flip_h == false:
			if state_machine.current_state.diferent_speed == true:
				velocity.x = dodge_speed
		elif sprite.flip_h == true:
			if state_machine.current_state.diferent_speed == true:
				velocity.x = -dodge_speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()
	change_animation()
	update_facing()
	update_health()
	
func change_animation():
	animation_tree.set("parameters/move/blend_position",direction.x)

func update_facing():
	if direction.x > 0:
		sprite.flip_h = false
	elif direction.x < 0:
		sprite.flip_h = true	

func update_health():
	healthChanged.emit()


func _on_weapon_area_2d_body_entered(body):
	if body.is_in_group("Enemy"):
		print("hit")


func _on_hurtbox_body_entered(body):
	if body.is_in_group("Enemy"):
		currentHealth -= 5
