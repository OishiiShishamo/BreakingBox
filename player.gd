extends Node2D

var window_position:Vector2
var player_speed:float = 60
var speed:float = 20
var grang:float = randf() * TAU

var grav_direction:Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	window_position = get_window().position
	
	$RigidBody2D.inertia = 100.0
	
	#var window_size = DisplayServer.window_get_size()
	#position = Vector2(window_size.x / 2, window_size.y / 2)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta:float):
	#var velocity = Vector2.ZERO
	
	GlobalVar.frame += 1
	#if Input.is_action_pressed("move_right"):
	#	velocity.x -= 1
	#if Input.is_action_pressed("move_left"):
	#	velocity.x += 1
	#if Input.is_action_pressed("move_down"):
	#	velocity.y -= 1
	#if Input.is_action_pressed("move_up"):
	#	velocity.y += 1
	
	var tmp:Vector2
	tmp = Vector2(Input.get_axis("move_left","move_right"), Input.get_axis("move_up","move_down"))
	if tmp.length() > 0.0 :
		grav_direction = tmp.normalized()

	if grav_direction.length() > 0.0:
		#velocity = velocity.normalized() * speed
		$RigidBody2D/AnimatedSprite2D.play()
	else:
		$RigidBody2D/AnimatedSprite2D.stop()
	
	#position += velocity * delta * player_speed
	#DisplayServer.window_set_size(Vector2i(abs(sin(PI / 180 * GlobalVar.frame * 12) * 640), abs(sin(PI / 180 * GlobalVar.frame * 12) * 480)))
	
	window_position += Vector2(-grav_direction.x, -grav_direction.y)
	
	get_window().position = Vector2i(window_position)
	$RigidBody2D.gravity_scale = 0.0
	$RigidBody2D.apply_force($RigidBody2D.mass * 50.0 * grav_direction * 9.8)
