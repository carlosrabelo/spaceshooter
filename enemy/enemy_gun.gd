extends Node2D

@onready var plBullet = preload("res://bullet/bullet_2.tscn")

@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start()

func _process(delta):
	pass

func _on_timer_timeout():
	var bullet = plBullet.instantiate()
	bullet.position = global_position
	get_tree().get_current_scene().add_child(bullet)
	timer.start()
