extends RigidBody2D

@onready var ball = $"../Ball" as Ball

var vel = Vector2(1.0,0.0)
var spd: float
var game_started = false

func _physics_process(delta):
	if game_started:
		spd = get_global_mouse_position().x - global_position.x
		move_and_collide(vel.normalized() * spd * 7 * delta)
	else:
		if Input.is_action_just_pressed("start"):
			game_started = true
			ball.load_game()
