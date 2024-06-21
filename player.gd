extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Vector2i default_window_potision = DisplayServer.window_get_position()
	Vector2i window_potision = Vector2i(0, 0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	DisplayServer.window_set_ime_position (Vector2i(default_window_potision.x + window_potision.x, default_window_potision.x + window_potision.x))
	pass
