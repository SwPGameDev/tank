extends RigidBody3D

@export var left_track_base : Node3D
@export var right_track_base : Node3D

@export var speed : float = 5

var turning_angular_dampening : float = 0
var straight_angular_dampening : float = 12.5


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("reset") :
		position.y += 3
		rotation.x = 0

func _physics_process(delta: float) -> void:
	
	if (Input.is_action_pressed("left_stick") && Input.is_action_pressed("right_stick")) || (Input.is_action_pressed("left_stick_reverse") && Input.is_action_pressed("right_stick_reverse")) :
		angular_damp = straight_angular_dampening
		print("straight on")
	elif Input.is_action_pressed("left_stick") || Input.is_action_pressed("right_stick") || Input.is_action_pressed("left_stick_reverse") || Input.is_action_pressed("right_stick_reverse") :
		angular_damp = turning_angular_dampening
		print("turning")
	else :
		angular_damp = straight_angular_dampening
		print("chillin or coasting or somethin")
	
	
	if Input.is_action_pressed("left_stick") :
		apply_impulse(basis.z * speed * delta, left_track_base.global_transform.origin - global_transform.origin)
	elif Input.is_action_pressed("left_stick_reverse") :
		apply_impulse(-1 * basis.z * speed * delta, left_track_base.global_transform.origin - global_transform.origin)
		
	if Input.is_action_pressed("right_stick") :
		apply_impulse(basis.z * speed * delta, right_track_base.global_transform.origin - global_transform.origin)
	elif Input.is_action_pressed("right_stick_reverse") :
		apply_impulse(-1 * basis.z * speed * delta, right_track_base.global_transform.origin - global_transform.origin)
