extends Area2D

class_name Enemy

@export var speed_ : float = 400

@onready var cantDie : bool = true

func _ready():
	pass

func _physics_process(delta):
	position.y += speed_ * delta

func _on_visible_on_screen_notifier_2d_screen_entered():
	cantDie = false

func _on_visible_on_screen_notifier_2d_screen_exited():
	if cantDie:
		return
	queue_free()
