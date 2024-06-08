#Script for level 1
extends Level

var ghost_warrior : PackedScene = preload("res://Characters/Enemies/Ghost Warrior(Walking)/ghost_warrior(walking).tscn")
var flying_eye : PackedScene = preload("res://Characters/Enemies/Flying Eye/Flying Eye.tscn")

@export var platform1_spawn_trigger : Area2D

#Setting variables upon scene being ready
@onready var animation_player = $FadeLayer/AnimationPlayer
@onready var level = $"."
@onready var Health = $CanvasLayer/Character_Health

var spawn1_triggered : bool = false
var spawn2_triggered : bool = false
var spawn3_triggered : bool = false
var spawn4_triggered : bool = false
var spawn5_triggered : bool = false
var spawn6_triggered : bool = false
var spawn7_triggered : bool = false

#Transitions in upon scene being ready
func _ready():
	animation_player.play("Transition_in")
	Health.max_value = find_child("playerCharacter").find_child("Damageable").health


func _physics_process(delta):
	update_health()
#Signal from area 2d "Next Level". Changes to next level after playing animation
func _on_next_level_body_entered(body):
	if body.is_in_group("playerCharacter"):
		animation_player.play("Transition_out")
		await animation_player.animation_finished
		get_tree().change_scene_to_file("res://Levels/Final_Level_2_PixelFantasyCave.tscn")

#Signal from killbox, Upon entering a kill box game over screen plays
func _on_kill_box_body_entered(body):
	if body.is_in_group("playerCharacter"):
		animation_player.play("Transition_out")
		await animation_player.animation_finished
		level.deathMenu() 
func update_health():
	Health.value = find_child("playerCharacter").find_child("Damageable").health
	


func _on_platform_1_enemy_spawn_trigger_body_entered(body):
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
		var enemy1 = ghost_warrior.instantiate()
		enemy1.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy1.position = Vector2(2741,386)
		add_child(enemy1)
		
		var enemy2 = ghost_warrior.instantiate()
		enemy2.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy2.position = Vector2(2841,386)
		add_child(enemy2)
		
		var enemy3 = ghost_warrior.instantiate()
		enemy3.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy3.position = Vector2(2941,386)
		add_child(enemy3)
		
		var enemy4 = flying_eye.instantiate()
		enemy4.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy4.position = Vector2(2741,186)
		add_child(enemy4)
		
		var enemy5 = ghost_warrior.instantiate()
		enemy5.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy5.position = Vector2(3041,386)
		add_child(enemy5)
		
		spawn3_triggered = true


func _on_platform_3_enemy_spawn_trigger_body_entered(body):
	if spawn4_triggered == false:
		var enemy1 = flying_eye.instantiate()
		enemy1.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy1.position = Vector2(3944,173)
		add_child(enemy1)
		
		var enemy2 = flying_eye.instantiate()
		enemy2.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy2.position = Vector2(4044,153)
		add_child(enemy2)
		
		var enemy3 = flying_eye.instantiate()
		enemy3.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy3.position = Vector2(4144,193)
		add_child(enemy3)
		
		var enemy4 = flying_eye.instantiate()
		enemy4.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy4.position = Vector2(3844,198)
		add_child(enemy4)
		
		var enemy5 = flying_eye.instantiate()
		enemy5.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy5.position = Vector2(3744,156)
		add_child(enemy5)
		
		spawn4_triggered = true


func _on_platform_4_enemy_spawn_trigger_body_entered(body):
	if spawn5_triggered == false:
		var enemy1 = ghost_warrior.instantiate()
		enemy1.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy1.position = Vector2(4732,394)
		add_child(enemy1)
		
		var enemy2 = ghost_warrior.instantiate()
		enemy2.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy2.position = Vector2(4900,394)
		add_child(enemy2)
		
		var enemy3 = flying_eye.instantiate()
		enemy3.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy3.position = Vector2(4632,364)
		add_child(enemy3)
		
		var enemy4 = flying_eye.instantiate()
		enemy4.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy4.position = Vector2(5000,364)
		add_child(enemy4)
		
		spawn5_triggered = true


func _on_platform_5_enemy_spawn_trigger_body_entered(body):
	if spawn6_triggered == false:
		var enemy1 = flying_eye.instantiate()
		enemy1.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy1.position = Vector2(5722,297)
		add_child(enemy1)
		
		var enemy2 = flying_eye.instantiate()
		enemy2.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy2.position = Vector2(5822,277)
		add_child(enemy2)
		
		var enemy3 = flying_eye.instantiate()
		enemy3.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy3.position = Vector2(5922,317)
		add_child(enemy3)
		
		var enemy4 = flying_eye.instantiate()
		enemy4.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy4.position = Vector2(5622,317)
		add_child(enemy4)
		
		var enemy5 = flying_eye.instantiate()
		enemy5.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy5.position = Vector2(5522,277)
		add_child(enemy5)
		
		spawn6_triggered = true


func _on_platform_6_enemy_spawn_trigger_body_entered(body):
	if spawn7_triggered == false:
		var enemy1 = ghost_warrior.instantiate()
		enemy1.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy1.position = Vector2(6414,391)
		add_child(enemy1)
		
		var enemy2 = ghost_warrior.instantiate()
		enemy2.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy2.position = Vector2(6296,391)
		add_child(enemy2)
		
		var enemy3 = flying_eye.instantiate()
		enemy3.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy3.position = Vector2(6375,306)
		add_child(enemy3)
		
		var enemy4 = flying_eye.instantiate()
		enemy4.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy4.position = Vector2(5622,317)
		add_child(enemy4)
		
		var enemy5 = flying_eye.instantiate()
		enemy5.target = get_tree().get_first_node_in_group("playerCharacter")
		enemy5.position = Vector2(6242,311)
		add_child(enemy5)
		
		spawn7_triggered = true
