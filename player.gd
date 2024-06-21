extends Area2D

var window_position:Vector2
var player_speed = 60.25
var speed = 10
var screen_size = get_viewport_rect().size
var frame = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	window_position = get_window().position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	frame += 1
	if Input.is_action_pressed("move_right"):
		velocity.x -= 1
		#window_potision.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x += 1
		#window_potision.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y -= 1
		#window_potision.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y += 1
		#window_potision.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	position += velocity * delta * player_speed
	DisplayServer.window_set_size(Vector2i(abs(sin(PI / 180 * frame * 12) * 640), abs(sin(PI / 180 * frame * 12) * 480)))
	window_position += Vector2(-velocity.x, -velocity.y)
	get_window().position = Vector2i(window_position)
	
	pass
