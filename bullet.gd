extends Area2D

@export var speed_ : float = 400

func _ready():
	pass

func _physics_process(delta):
	position.y -= speed_ * delta

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()

func _on_area_entered(area):
	if area is Enemy:
		area.queue_free()
		queue_free()
