extends CharacterBody2D


@export var speed: float = 200.0

@onready var sprite : Sprite2D = $Sprite2D

@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var animation_lock : bool = false
var direction : Vector2 = Vector2.ZERO
var in_air :bool = false

func _ready():
	animation_tree.active = true;
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		in_air = true
	else:
		if in_air == true:
			land()	
		in_air = false
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		pass##jump()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("left", "right","up","down")
	
	if direction.x != 0 && state_machine.get_can_move():
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()
	change_animation()
	update_facing()
func change_animation():
	animation_tree.set("parameters/move/blend_position",direction.x)

func update_facing():
	if direction.x > 0:
		sprite.flip_h = false
	elif direction.x < 0:
		sprite.flip_h = true	


func land():
	##sprite.play("jump_fall")
	animation_lock = true


##func _on_sprite_2d_animation_finished():
##	if(sprite.animation == "jump_fall"):
##		animation_lock = false
