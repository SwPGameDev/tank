extends RigidBody3D

@export var left_track_base : Node3D
@export var right_track_base : Node3D

@export var speed : float = 5


func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("left_stick") :
		apply_impulse(basis.z * speed * delta, left_track_base.global_transform.origin - global_transform.origin)
	elif Input.is_action_pressed("left_stick_reverse") :
		apply_impulse(-1 * basis.z * speed * delta, left_track_base.global_transform.origin - global_transform.origin)
		
	if Input.is_action_pressed("right_stick") :
		apply_impulse(basis.z * speed * delta, right_track_base.global_transform.origin - global_transform.origin)
	elif Input.is_action_pressed("right_stick_reverse") :
		apply_impulse(-1 * basis.z * speed * delta, right_track_base.global_transform.origin - global_transform.origin)
