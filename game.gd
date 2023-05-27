extends Node2D

@onready var player = $Player

func _ready():
	RenderingServer.set_default_clear_color(Color.BLACK)
	Globals.view_rect = get_viewport_rect().size
	player.position = Vector2(Globals.view_rect.x / 2, Globals.view_rect.y - 60)
