extends RigidBody3D
class_name player_tank

@export var left_track_base : Node3D
@export var right_track_base : Node3D

@export var speed : float = 500
@export var tank_mass : float = 50

var falling_angular_damp : float = 0.1
var turning_angular_dampening : float = 0.5
var straight_angular_dampening : float = 12

var grounded : bool

func _ready() -> void:
	self.mass = tank_mass
	

func _physics_process(delta: float) -> void:
	#print(self.get_contact_count())
	
	# Grounded Test
	if self.get_contact_count() == 0 :
		grounded = false
		angular_damp = falling_angular_damp
	else :
		grounded = true
		if (Input.is_action_pressed("left_stick") && Input.is_action_pressed("right_stick")) || (Input.is_action_pressed("left_stick_reverse") && Input.is_action_pressed("right_stick_reverse")) :
			angular_damp = straight_angular_dampening
		elif Input.is_action_pressed("left_stick") || Input.is_action_pressed("right_stick") || Input.is_action_pressed("left_stick_reverse") || Input.is_action_pressed("right_stick_reverse") :
			angular_damp = turning_angular_dampening
		else :
			angular_damp = straight_angular_dampening
	
	
	# Track control
	var left_stick_position = Input.get_axis("left_stick_reverse", "left_stick")
	var right_stick_position = Input.get_axis("right_stick_reverse", "right_stick")
	if left_stick_position != 0 :
		# LEFT TRACK ANIMATION
		if grounded :
			apply_impulse(basis.z * speed * delta * left_stick_position, left_track_base.global_transform.origin - global_transform.origin)
	if right_stick_position != 0 :
		# RIGHT TRACK ANIMATION
		if grounded :
			apply_impulse(basis.z * speed * delta * right_stick_position, right_track_base.global_transform.origin - global_transform.origin)
	
	# Flips tank over
	if Input.is_action_just_pressed("reset") :
		position.y += 3
		angular_velocity = Vector3.ZERO
		linear_velocity = Vector3.ZERO
		rotation = Vector3(0, rotation.y, 0)
	
