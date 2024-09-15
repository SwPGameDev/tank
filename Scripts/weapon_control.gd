extends Node

@export var turret : Node3D
@export var barrel : Node3D

@export var rotate_speed : float
@export var elevate_speed : float

@export var max_elevate : float = -20
@export var min_elevate : float = 9

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Turret left right
	if Input.is_action_pressed("traverse_left") :
		turret.rotate_y(rotate_speed * delta)
	
	if Input.is_action_pressed("traverse_right") :
		turret.rotate_y(-1 * rotate_speed * delta)
	
	# Barrel up down
	if Input.is_action_pressed("elevate_up") && barrel.rotation_degrees.x > max_elevate :
		barrel.rotate_x(-1 * elevate_speed * delta)
	
	if Input.is_action_pressed("eleveate_down") && barrel.rotation_degrees.x < min_elevate :
		barrel.rotate_x(elevate_speed * delta)
