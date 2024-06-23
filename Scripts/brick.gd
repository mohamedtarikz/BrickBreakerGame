extends RigidBody2D

class_name Brick

@onready var sprite = $Sprite2D

@export var level = 0
@export var color = 0

var degrs = [
	[preload("res://Assets/Sprites/Gbrick.png"), preload("res://Assets/Sprites/GBrickbroken.png")],
	[preload("res://Assets/Sprites/BBrick.png"), preload("res://Assets/Sprites/BBrickbroken.png")],
	[preload("res://Assets/Sprites/RBrick.png"), preload("res://Assets/Sprites/RBrickbrocken.png")]
]

signal destroyed

func set_texture(newlevel):
	level = newlevel
	if color >= 0:
		if level == 2:
			sprite.texture = degrs[color][0]
		elif level == 1:
			sprite.texture = degrs[color][1]
		else:
			color -= 1
			set_texture(2)
	else:
		destroyed.emit()
		queue_free()

func _ready():
	set_texture(level)
