#Boss Level script
#Used to play music when entering scene
#Extends Level to allow access to pause menu functions

extends Level
@onready var animation_player = $CanvasLayer2/AnimationPlayer
@onready var level = $"."
@onready var Health = $CanvasLayer/Character_Health
@onready var boss_Health = $CanvasLayer/Boss_health
@onready var player = $playerCharacter
@onready var portal_player = $PortalPlayer

func _ready():
	pause_menu.hide()
	player.hide()
	Health.max_value = find_child("playerCharacter").find_child("Damageable").health
	boss_Health.max_value = find_child("Ghost Warrior(Walking)").find_child("Damageable").health
	animation_player.play("Transition_in")
	MenuMusic.play_boss_music()
	portal_player.play("Portal_Enter")
	await portal_player.animation_finished
	player.show()
	portal_player.play("Portal_exit")
	
	
	
func _physics_process(delta):
	update_health()
	update_boss_health()

func update_health():
	Health.value = find_child("playerCharacter").find_child("Damageable").health
func update_boss_health():
	boss_Health.value = find_child("Ghost Warrior(Walking)").find_child("Damageable").health
