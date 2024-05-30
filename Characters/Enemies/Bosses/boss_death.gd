extends CharacterBody2D

class_name boss

@onready var player: CharacterBody2D = $"../playerCharacter"
@onready var sprite = $Sprite2D
@onready var health_bar = $ProgressBar
@onready var max_health = 100
@onready var current_health = max_health

var direction : Vector2

func _ready():
	health_bar.max_value = max_health
	set_physics_process(false)
	
func _process(_delta):
	direction = player.position - position
	
	
func _physics_process(delta):
	velocity = direction.normalized()*200
	update_health()
	move_and_collide(velocity * delta)
	if current_health <= 0:
		owner.find_child("FiniteStateMachine").change_state("Death")
func update_health():
	health_bar.value = current_health

func _on_boss_hurtbox_area_entered(area):
	current_health -= 10
