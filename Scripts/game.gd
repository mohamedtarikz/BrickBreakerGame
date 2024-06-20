extends Node2D

var BALL = preload("res://Scenes/ball.tscn")
@onready var ball = $Ball as Ball
@onready var label = $CanvasLayer/Label
@onready var game_over = $GameOver
@onready var win = $Win
@onready var bricks = $Bricks

var lives = 3

func _ready():
	for child in bricks.get_children():
		child.destroyed.connect(update_cnt)

func _on_killzone_body_entered(body):
	lives -= 1
	label.text = "Lives: " + str(lives)
	if lives == 0:
		game_over.visible = 1
		get_tree().paused = 1
	else:
		reload()

func reload():
	print("moot")
	ball.queue_free()
	ball = BALL.instantiate()
	ball.load_game()
	add_child(ball)

var brick_cnt = 60

func update_cnt():
	brick_cnt -= 1
	if brick_cnt == 0:
		win.visible = 1
		get_tree().paused = 1
