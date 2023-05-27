extends Area2D

@onready var plBullet = preload("res://bullet.tscn")

@onready var muzzle1 = $Marker2D1
@onready var muzzle2 = $Marker2D2

@export var speed_ : float = 250

var lX = 0
var lY = 0
var rX = 0
var rY = 0

var direction = Vector2.ZERO

func _ready():
	var vr = get_viewport_rect().size
	
	lX = 36
	lY = 36
	rX = vr.x - 36
	rY = vr.y - 36

func _physics_process(delta):
	if Input.is_action_just_pressed("game_fire"):
		var bullet1 = plBullet.instantiate()
		var bullet2 = plBullet.instantiate()
		bullet1.global_position = muzzle1.global_position
		bullet2.global_position = muzzle2.global_position
		get_tree().current_scene.add_child(bullet1)
		get_tree().current_scene.add_child(bullet2)

	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	position += direction * speed_ * delta

	position.x = clamp(position.x, lX, rX)
	position.y = clamp(position.y, lY, rY)
