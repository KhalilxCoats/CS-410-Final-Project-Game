#Script for level 2
extends Level
#Setting variables up ready
@onready var animation_player = $FadeLayer/AnimationPlayer
@onready var portal_player = $PortalPlayer
@onready var level = $"."
@onready var Health = $CanvasLayer/Character_Health

var ghost_warrior : PackedScene = preload("res://Characters/Enemies/Ghost Warrior(Walking)/ghost_warrior(walking).tscn")
var flying_eye : PackedScene = preload("res://Characters/Enemies/Flying Eye/Flying Eye.tscn")

var spawn1_triggered : bool = false
var spawn2_triggered : bool = false
var spawn3_triggered : bool = false
var spawn4_triggered : bool = false
var spawn5_triggered : bool = false
var spawn6_triggered : bool = false
var spawn7_triggered : bool = false
var spawn8_triggered : bool = false
var spawn9_triggered : bool = false

#Play animation upon ready
func _ready():
	animation_player.play("Transition_in")
	Health.max_value = find_child("playerCharacter").find_child("Damageable").health
func _physics_process(delta):
	update_health()
#Upon entering next level area, transition to boss level
func _on_next_level_body_entered(body):
	if body.is_in_group("playerCharacter"):
		portal_player.play("Portal_Enter")
		await portal_player.animation_finished
		animation_player.play("Transition_out")
		await animation_player.animation_finished
		get_tree().change_scene_to_file("res://Levels/boss_level.tscn")

#Upon entering kill box, show death screen
func _on_kill_box_body_entered(body):
	if body.is_in_group("playerCharacter"):
		animation_player.play("Transition_out")
		await animation_player.animation_finished
		level.deathMenu()  

func update_health():
	Health.value = find_child("playerCharacter").find_child("Damageable").health


func _on_platform_1_enemy_spawn_trigger_1_body_entered(body):
	if spawn1_triggered == false:
		var enemy1 = ghost_warrior.instantiate()
		enemy1.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy1.position = Vector2(1252,386)
		add_child(enemy1)
		
		var enemy2 = ghost_warrior.instantiate()
		enemy2.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy2.position = Vector2(1352,386)
		add_child(enemy2)
		
		var enemy3 = flying_eye.instantiate()
		enemy3.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy3.position = Vector2(1152,186)
		add_child(enemy3)
		
		var enemy4 = flying_eye.instantiate()
		enemy4.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy4.position = Vector2(1252,186)
		add_child(enemy4)
		
		var enemy5 = ghost_warrior.instantiate()
		enemy5.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy5.position = Vector2(1652,386)
		add_child(enemy5)
		
		spawn1_triggered = true


func _on_platform_1_enemy_spawn_trigger_2_body_entered(body):
	if spawn2_triggered == false:
		var enemy1 = ghost_warrior.instantiate()
		enemy1.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy1.position = Vector2(1985,386)
		add_child(enemy1)
		
		var enemy2 = ghost_warrior.instantiate()
		enemy2.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy2.position = Vector2(2085,386)
		add_child(enemy2)
		
		var enemy3 = flying_eye.instantiate()
		enemy3.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy3.position = Vector2(1885,186)
		add_child(enemy3)
		
		var enemy4 = flying_eye.instantiate()
		enemy4.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy4.position = Vector2(1985,186)
		add_child(enemy4)
		
		var enemy5 = ghost_warrior.instantiate()
		enemy5.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy5.position = Vector2(2085,386)
		add_child(enemy5)
		
		spawn2_triggered = true


func _on_platform_2_enemy_spawn_trigger_body_entered(body):
	if spawn3_triggered == false:
		var enemy1 = flying_eye.instantiate()
		enemy1.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy1.position = Vector2(2925,-33)
		add_child(enemy1)
		
		var enemy2 = flying_eye.instantiate()
		enemy2.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy2.position = Vector2(2984,-31)
		add_child(enemy2)
		
		var enemy3 = flying_eye.instantiate()
		enemy3.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy3.position = Vector2(3025,-55)
		add_child(enemy3)
		
		var enemy4 = flying_eye.instantiate()
		enemy4.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy4.position = Vector2(2876,-49)
		add_child(enemy4)
		
		spawn3_triggered = true


func _on_platform_2_enemy_spawn_trigger_2_body_entered(body):
	if spawn4_triggered == false:
		var enemy1 = ghost_warrior.instantiate()
		enemy1.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy1.position = Vector2(3439,435)
		add_child(enemy1)
		
		var enemy2 = ghost_warrior.instantiate()
		enemy2.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy2.position = Vector2(3499,434)
		add_child(enemy2)
		spawn4_triggered = true


func _on_platform_3_enemy_spawn_trigger_body_entered(body):
	if spawn5_triggered == false:
		var enemy1 = ghost_warrior.instantiate()
		enemy1.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy1.position = Vector2(4080,437)
		add_child(enemy1)
		
		var enemy2 = ghost_warrior.instantiate()
		enemy2.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy2.position = Vector2(3990,437)
		add_child(enemy2)
		
		var enemy3 = flying_eye.instantiate()
		enemy3.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy3.position = Vector2(4218,119)
		add_child(enemy3)
		
		var enemy4 = flying_eye.instantiate()
		enemy4.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy4.position = Vector2(4325,129)
		add_child(enemy4)
		
		var enemy5 = flying_eye.instantiate()
		enemy5.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy5.position = Vector2(4333,33)
		add_child(enemy5)
		
		spawn5_triggered = true


func _on_platform_4_enemy_spawn_trigger_body_entered(body):
	if spawn6_triggered == false:
		var enemy1 = ghost_warrior.instantiate()
		enemy1.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy1.position = Vector2(5095,427)
		add_child(enemy1)
		
		var enemy2 = ghost_warrior.instantiate()
		enemy2.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy2.position = Vector2(5273,424)
		add_child(enemy2)
		
		var enemy3 = flying_eye.instantiate()
		enemy3.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy3.position = Vector2(5195,269)
		add_child(enemy3)
		
		var enemy4 = flying_eye.instantiate()
		enemy4.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy4.position = Vector2(5103,281)
		add_child(enemy4)
		
		var enemy5 = ghost_warrior.instantiate()
		enemy5.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy5.position = Vector2(5182,421)
		add_child(enemy5)
		
		spawn6_triggered = true


func _on_platform_5_enemy_spawn_trigger_body_entered(body):
	if spawn7_triggered == false:
		var enemy1 = ghost_warrior.instantiate()
		enemy1.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy1.position = Vector2(6470,427)
		add_child(enemy1)
		
		var enemy2 = ghost_warrior.instantiate()
		enemy2.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy2.position = Vector2(6572,422)
		add_child(enemy2)
		
		var enemy3 = ghost_warrior.instantiate()
		enemy3.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy3.position = Vector2(6660,422)
		add_child(enemy3)
		
		var enemy4 = ghost_warrior.instantiate()
		enemy4.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy4.position = Vector2(6753,425)
		add_child(enemy4)
		
		var enemy5 = ghost_warrior.instantiate()
		enemy5.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy5.position = Vector2(6864,422)
		add_child(enemy5)
		
		var enemy6 = flying_eye.instantiate()
		enemy6.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy6.position = Vector2(6653,241)
		add_child(enemy6)
		
		var enemy7 = flying_eye.instantiate()
		enemy7.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy7.position = Vector2(6759,206)
		add_child(enemy7)
		
		var enemy8 = flying_eye.instantiate()
		enemy8.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy8.position = Vector2(6831,248)
		add_child(enemy8)
		
		spawn7_triggered = true


func _on_platform_6_enemy_spawn_trigger_body_entered(body):
	if spawn8_triggered == false:
		var enemy1 = flying_eye.instantiate()
		enemy1.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy1.position = Vector2(7602,100)
		add_child(enemy1)
		
		var enemy2 = flying_eye.instantiate()
		enemy2.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy2.position = Vector2(7652,80)
		add_child(enemy2)
		
		var enemy3 = flying_eye.instantiate()
		enemy3.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy3.position = Vector2(7752,100)
		add_child(enemy3)
		
		var enemy4 = flying_eye.instantiate()
		enemy4.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy4.position = Vector2(7702,80)
		add_child(enemy4)
		
		var enemy5 = flying_eye.instantiate()
		enemy5.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy5.position = Vector2(7677,55)
		add_child(enemy5)
		
		spawn8_triggered = true


func _on_platform_7_enemy_spawn_trigger_body_entered(body):
	if spawn9_triggered == false:
		var enemy1 = ghost_warrior.instantiate()
		enemy1.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy1.position = Vector2(10136,405)
		add_child(enemy1)
		
		var enemy2 = ghost_warrior.instantiate()
		enemy2.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy2.position = Vector2(10251,400)
		add_child(enemy2)
		
		var enemy3 = ghost_warrior.instantiate()
		enemy3.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy3.position = Vector2(10352,407)
		add_child(enemy3)
		
		var enemy4 = flying_eye.instantiate()
		enemy4.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy4.position = Vector2(10310,233)
		add_child(enemy4)
		
		var enemy5 = flying_eye.instantiate()
		enemy5.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy5.position = Vector2(10231,162)
		add_child(enemy5)
		
		spawn9_triggered = true
