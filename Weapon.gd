extends Node2D

var velocity = Vector2.ZERO
var speed = 0.3
var min_range = Vector2.ZERO
var max_range = Vector2.ZERO


func _ready():
	max_range = get_viewport().size

func _physics_process(_delta):
	velocity.y -= speed
	position += velocity.rotated(rotation)
	if position.x < min_range.x or position.y < min_range.y or position.x > max_range.x or position.y > max_range.y:
		queue_free()
