extends Node

@export_category("Wheels Properties")

@export_group("Wheels References")
@export var left_wheel : VehicleWheel3D
@export var right_wheel : VehicleWheel3D

@export_group("Vehicle Motion")
@export var use_as_traction : bool = false
@export var use_as_steering : bool = false

@export_group("Wheel")
@export var roll_influence : float = 0.1
@export var radius : float = 0.5
@export var rest_legnth : float = 0.15
@export var friction_slip : float = 10.5

@export_group("Suspension")
@export var travel : float = 0.2
@export var stiffness : float = 50
@export var max_force : float = 6000

@export_group("Damping")
@export var compression : float = 0.83
@export var relaxation : float = 0.88


func _ready() -> void:
	left_wheel.use_as_traction = use_as_traction
	left_wheel.use_as_steering = use_as_steering
	left_wheel.wheel_roll_influence = roll_influence
	left_wheel.wheel_radius = radius
	left_wheel.wheel_rest_length = rest_legnth
	left_wheel.wheel_friction_slip = friction_slip
	left_wheel.suspension_travel = travel
	left_wheel.suspension_stiffness = stiffness
	left_wheel.suspension_max_force = max_force
	left_wheel.damping_compression = compression
	left_wheel.damping_relaxation = relaxation
	
	right_wheel.use_as_traction = use_as_traction
	right_wheel.use_as_steering = use_as_steering
	right_wheel.wheel_roll_influence = roll_influence
	right_wheel.wheel_radius = radius
	right_wheel.wheel_rest_length = rest_legnth
	right_wheel.wheel_friction_slip = friction_slip
	right_wheel.suspension_travel = travel
	right_wheel.suspension_stiffness = stiffness
	right_wheel.suspension_max_force = max_force
	right_wheel.damping_compression = compression
	right_wheel.damping_relaxation = relaxation
