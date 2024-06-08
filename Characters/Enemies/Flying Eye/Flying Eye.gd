extends CharacterBody2D

@onready var animation_tree : AnimationTree = $AnimationTree

const SPEED = 150.0

@export var facing = 1

var direction : Vector2 = Vector2.ZERO

@onready var state_machine : CharacterStateMachine = $CharacterStateMachine

@export var target : Node2D
@export var nav :NavigationAgent2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	animation_tree.active = true
	nav.path_desired_distance = 10.0
	nav.target_desired_distance = 10.0
	
	call_deferred("actor_setup")

func _physics_process(delta):
	# Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta
	
	# Sets a speed limit to prevent overshoot
	var distance = global_transform.origin.distance_to(nav.target_position)
	var max_speed = SPEED
	if distance < 10:
		max_speed = 0
	
	var current_agent_position: Vector2 = global_position
	var next_path_position = nav.get_next_path_position()
	var new_velocity : Vector2 =  next_path_position - current_agent_position
	new_velocity = new_velocity.normalized()
	new_velocity *= min(SPEED, max_speed)
	
	# Makes sure velocity is zero when it should be to avoid float math problems
	if(velocity.is_zero_approx()):
		velocity.x = 0
		velocity.y = 0
	
	var direction = to_local(nav.get_next_path_position())
	if direction.x != 0 && state_machine.current_state.can_move:
		velocity = new_velocity
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	change_animation()
	move_and_slide()
	
	if(state_machine.current_state.can_flip == true):
		update_facing()

func actor_setup():
	await get_tree().physics_frame
	nav.target_position = target.global_position

func set_target():
	if(target.global_position.x - global_position.x < 0):
		var target_calc : Vector2 = target.global_position
		target_calc.x += 20
		nav.target_position = target_calc
		nav.target_position.y -= 20
	elif(target.global_position.x - global_position.x > 0):
		var target_calc : Vector2 = target.global_position
		target_calc.x -= 20
		nav.target_position = target_calc
		nav.target_position.y -= 20

func _on_nav_path_maker_timeout():
	set_target()
	

func change_animation():
	animation_tree.set("parameters/move/blend_position",velocity.x)

func update_facing():
	if(target.global_position.x - global_position.x < 0 && facing == 1):
		scale.x = -1
		#healthbar.scale.x = 1
		facing = -1
	elif(target.global_position.x - global_position.x > 0 && facing == -1):
		scale.x = -1
		#healthbar.scale.x = -1
		facing = 1
