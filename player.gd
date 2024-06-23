extends Node2D

#変数初期化
var window_position:Vector2
var player_speed:float = 60
var speed:float = 20
var grang:float = randf() * TAU

# Called when the node enters the scene tree for the first time.
func _ready():
	#ウィンドウの座標を取得
	window_position = get_window().position
	#var window_size = DisplayServer.window_get_size()
	#position = Vector2(window_size.x / 2, window_size.y / 2)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta:float):
	#ベロシティを初期化
	var velocity = Vector2.ZERO
	#経過フレームをカウント
	GlobalVar.frame += 1
	#入力を受け取ってベロシティに渡す
	velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	#Godot Docsにあったやつ
	#多分停止アニメーションと動作アニメーションを分岐させてる
	#あとベロシティをノーマライズしてspeedを掛けてる
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$RigidBody2D/AnimatedSprite2D.play()
	else:
		$RigidBody2D/AnimatedSprite2D.stop()
	#座標をベロシティを元に動かす
	position += velocity * delta * player_speed
	#ウィンドウサイズを経過フレームを元に三角関数を活用して変えている
	#DisplayServer.window_set_size(Vector2i(abs(sin(PI / 180 * GlobalVar.frame * 12) * 640), abs(sin(PI / 180 * GlobalVar.frame * 12) * 480)))
	#ウィンドウの座標にベロシティを反転させたものを足してウィンドウを動かしている
	#直接Vector2iで代入するとズレたのでVector2の変数を間に挟んでいる
	window_position += Vector2(-velocity.x, -velocity.y)
	get_window().position = Vector2i(window_position)
	#重力
	$RigidBody2D.gravity_scale = 0.0
	$RigidBody2D.apply_force($RigidBody2D.mass * 1000 * Vector2(cos(grang), sin(grang)) * 9.8)
	pass
