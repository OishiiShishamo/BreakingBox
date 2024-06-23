extends Node2D

func _ready():
	_play_sound("5000tyouen")
	pass # Replace with function body.

func _play_sound(idx):
	# 指定したIDのサウンドを再生
	# 一旦停止する
	$AudioStreamPlayer2D.stop()

	# サウンドファイルのパスを作成
	var path = "res://%s.wav"%idx

	# 動的に読み込んで steam に割り当てる
	$AudioStreamPlayer2D.stream = load(path)

	# 再生
	$AudioStreamPlayer2D.play()

func _process(delta):
	pass
