extends Node2D

@onready var plEnemy = preload("res://enemy/enemy.tscn")

@onready var timer = $Timer

var vr = Rect2()

func _ready():
	vr = get_viewport_rect().size
	timer.start()

func _process(delta):
	pass

func _on_timer_timeout():
	spawn_enemies()
	timer.start()

func spawn_enemies():
	var posX = randf_range(72, vr.x-72)
	var enemy = plEnemy.instantiate()
	enemy.global_position = Vector2(posX, -100)
	get_tree().get_current_scene().add_child(enemy)
