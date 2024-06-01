#Boss Script

extends CharacterBody2D

class_name boss

#Variables and imports used in this script
@onready var player: CharacterBody2D = $"../playerCharacter"
@onready var sprite = $Sprite2D
@onready var health_bar = $ProgressBar
@onready var max_health = 100
@onready var current_health = max_health

var direction : Vector2

#When entering this function set Health of progress bar, to Max_health of boss
#Turn off physics process so no moving before aggro range
func _ready():
	health_bar.max_value = max_health
	set_physics_process(false)
	
#Finding which direction player is
func _process(_delta):
	direction = player.position - position
	
	
#Physics processing which is used for movement of boss
#Determines velocity of boss
#Moves boss
#Checks bosses healthh and updates health. If health is less than 0 change to death state
func _physics_process(delta):
	velocity = direction.normalized()*100
	update_health()
	move_and_slide()
	if current_health <= 0:
		owner.find_child("FiniteStateMachine").change_state("Death")

#Updating health bar with current health value
func update_health():
	health_bar.value = current_health
#When hurtbox is entered, boss takes damage
func _on_boss_hurtbox_area_entered(area):
	current_health -= 10

#
func _on_weapon_hit_box_area_entered(area):
	print("Hit!")
