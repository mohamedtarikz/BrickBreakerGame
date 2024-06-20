extends RigidBody2D

class_name Brick

@onready var sprite = $Sprite2D

@export var level = 0

var degrs = [
	preload("res://Assets/Sprites/Gbrick.png"),
	preload("res://Assets/Sprites/Bbrick.png"),
	preload("res://Assets/Sprites/Rbrick.png")
]

signal destroyed

func set_texture(newlevel):
	level = newlevel
	if level >= 1:
		sprite.texture = degrs[level - 1]
	else:
		destroyed.emit()
		queue_free()

func _ready():
	set_texture(level)
