extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Vector2i default_window_potision = DisplayServer.window_get_position()
	Vector2i window_potision = Vector2i(0, 0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	DisplayServer.window_set_ime_position (Vector2i(default_window_potision.x + window_potision.x, default_window_potision.x + window_potision.x))
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x -= 1
		window_potision.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x += 1
		window_potision.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y -= 1
		window_potision.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y += 1
		window_potision.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	pass
