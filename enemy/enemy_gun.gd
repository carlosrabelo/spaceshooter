extends Node2D

@onready var plBullet = preload("res://bullet/bullet_2.tscn")

@onready var player : Player = get_tree().get_current_scene().get_node("Player")

@onready var timer = $Timer

func _ready():
	timer.start()

func _on_timer_timeout():
	if player == null:
		return
	var distance = player.position.y - global_position.y
	# TODO: Use this point in future to create difficulty
	if distance < 20:
		return
	var direction = global_position.direction_to(player.position).normalized()
	var bullet = plBullet.instantiate()
	bullet.position = global_position
	bullet.set_direction(direction)
	get_tree().get_current_scene().add_child(bullet)
	timer.start()
