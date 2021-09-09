extends Node2D

var acc_amount = 0.02
var velocity = Vector2(0,0)
var min_range = Vector2(0,0)
var max_range = Vector2(0,0)

var Weapon = preload("res://Weapon.tscn")
var Weapons = null

func _ready():
	max_range = get_viewport().size

func _physics_process(_delta):
	

	velocity += get_input()*acc_amount

	position += velocity
	position.x = wrapf(position.x,min_range.x,max_range.x)
	position.y = wrapf(position.y,min_range.y,max_range.y)


	if Input.is_action_just_pressed("shoot"):
		if Weapons == null:
			Weapons = get_node_or_null("/root/Game/Weapons")
		if Weapons != null:
			var weapon = Weapon.instance()
			weapon.position = position + Vector2(0,-12).rotated(rotation)
			weapon.rotation = rotation
			Weapons.add_child(weapon)
		

func get_input():
	return Vector2.ZERO
