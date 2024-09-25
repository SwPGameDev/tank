extends Node

@export_group("Label")
@export var throttle_label : Label3D

@export_group("Refernces")
@export var tank_base : VehicleBody3D
@export var gear_control : Node
@export var wheel_properties : Node

@export var left_wheels : Array[VehicleWheel3D] = []
@export var right_wheels : Array[VehicleWheel3D] = []
var combined_wheels : Array[VehicleWheel3D] = left_wheels + right_wheels

@export_group("Variables")
var current_throttle : float
@export var max_throttle : float = 20
@export var throttle_acceleration : float = 10

func _ready() -> void:
	for temp_wheel in combined_wheels :
		wheel_properties.apply_properties(temp_wheel)
	

func _process(delta: float) -> void:
	throttle_label.text = "Throttle: " + str(current_throttle)
	
	if Input.is_action_pressed("throttle_up") && current_throttle < max_throttle :
		current_throttle += delta * throttle_acceleration
		if current_throttle > max_throttle :
			current_throttle = max_throttle
	
	if Input.is_action_pressed("throttle_down") && current_throttle > 0 :
		current_throttle -= delta * throttle_acceleration
		if current_throttle < 0 :
			current_throttle = 0
	
	# ENGINE CONTROL
	if gear_control.current_gear == gear_control.gear_types.reverse :
		tank_base.engine_force = -1 * current_throttle
	elif gear_control.current_gear == gear_control.gear_types.neutral :
		tank_base.engine_force = 0
	elif gear_control.current_gear == gear_control.gear_types.drive :
		tank_base.engine_force = current_throttle
	elif gear_control.current_gear == gear_control.gear_types.turbo :
		tank_base.engine_force = 2 * current_throttle
	
	# LEFT STICK
	if Input.is_action_pressed("left_stick") :
		for wheel in left_wheels :
			wheel.use_as_traction = true
	if Input.is_action_just_released("left_stick") :
		for wheel in left_wheels :
			wheel.use_as_traction = false
		
	
	# RIGHT STICK
	if Input.is_action_pressed("right_stick") :
		for wheel in right_wheels :
			wheel.use_as_traction = true
	if Input.is_action_just_released("right_stick") :
		for wheel in right_wheels :
			wheel.use_as_traction = false
		
	
