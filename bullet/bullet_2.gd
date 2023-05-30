extends Area2D

@export var _speed : float = 600

var _direction : Vector2 = Vector2.DOWN
var _ready : bool = false

func _physics_process(delta):
	if not _ready:
		return
	position += _direction * _speed * delta

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()

func _on_area_entered(area):
	if area is Player:
		area.queue_free()
		queue_free()

func set_direction(direction : Vector2):
	_direction = direction
	_ready = true
