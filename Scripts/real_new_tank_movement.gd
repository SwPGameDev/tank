extends RigidBody3D

@export var left_track_base : Node3D
@export var right_track_base : Node3D

@export var speed : float = 5

var local_transform
var forward
var backward
var left
var right

func _ready() -> void:
	local_transform = get_global_transform().basis


func _process(delta: float) -> void:
	
	forward = local_transform.z
	backward = -local_transform.z
	left = local_transform.x
	right = -local_transform.x
	
	print(local_transform.z)
	
	if Input.is_action_pressed("left_stick") :
		apply_force(-global_transform.basis.z * speed * delta, left_track_base.position)
		
	if Input.is_action_pressed("left_stick_reverse") :
		apply_force(Vector3.FORWARD * speed * delta, left_track_base.position)
		
	if Input.is_action_pressed("right_stick") :
		apply_force(-Vector3.FORWARD * speed * delta, right_track_base.position)
		
	if Input.is_action_pressed("right_stick_reverse") :
		apply_force(Vector3.FORWARD * speed * delta, right_track_base.position)
