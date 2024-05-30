extends CharacterBody2D

class_name boss

@onready var player: CharacterBody2D = $"../playerCharacter"
@onready var sprite = $Sprite2D
@onready var max_health = 100
@onready var current_health = max_health

var direction : Vector2

func _ready():
	set_physics_process(false)
	
func _process(_delta):
	direction = player.position - position
	
	
func _physics_process(delta):
	velocity = direction.normalized()*100
	move_and_collide(velocity * delta)
