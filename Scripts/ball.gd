extends CharacterBody2D

class_name Ball

@export var spd = 500

var start_pos = Vector2(576,397)
var collider


func _physics_process(delta):
	collider = move_and_collide(velocity * spd * delta)
	if collider:
		velocity = velocity.bounce(collider.get_normal()).normalized()
		var coll = collider.get_collider()
		if coll is Brick:
			coll.set_texture(coll.level - 1)


func load_game():
	position = start_pos
	randomize()
	velocity = Vector2(randf_range(-1,1),randf_range(-1,-0.1)).normalized()
	
