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
	var pos = get_viewport().get_mouse_position()
	look_at(pos)
	rotation_degrees += 90 #corrects rotation

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
	var input_dir = Vector2(0,0)
	if Input.is_action_pressed("forward"):
		input_dir.y -= 1
	if Input.is_action_pressed("back"):
		input_dir.y += 1
	if Input.is_action_pressed("left"):
		input_dir.x -= 1
	if Input.is_action_pressed("right"):
		input_dir.x += 1
	return input_dir.rotated(rotation)
