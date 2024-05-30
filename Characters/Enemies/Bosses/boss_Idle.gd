extends "res://Characters/Enemies/Bosses/state2.gd"

@onready var collision = $"../../PlayerDetection/CollisionShape2D"
@onready var progress_bar = $"../../CanvasLayer/ProgressBar"
@onready var count = 0

var player_entered: bool = false:
	set(value):
		player_entered = value
		collision.set_deferred("disabled",value)
		progress_bar.set_deferred("visible",value)

func transition():
	if player_entered:
		get_parent().change_state("Move")

func _on_player_detection_body_entered(body):
	print(count)
	if(count > 1 ) :
		player_entered = true
	count += 1
