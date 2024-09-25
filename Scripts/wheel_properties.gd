extends Node

@export_group("Wheels References")

#@export var wheels : Array[VehicleWheel3D] = []

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


#func _ready() -> void:
	#for current_wheel in wheels :
		#apply_properties(current_wheel)
	#

func apply_properties(wheel : VehicleWheel3D) :
	wheel.use_as_traction = use_as_traction
	wheel.use_as_steering = use_as_steering
	wheel.wheel_roll_influence = roll_influence
	wheel.wheel_radius = radius
	wheel.wheel_rest_length = rest_legnth
	wheel.wheel_friction_slip = friction_slip
	wheel.suspension_travel = travel
	wheel.suspension_stiffness = stiffness
	wheel.suspension_max_force = max_force
	wheel.damping_compression = compression
	wheel.damping_relaxation = relaxation
	
