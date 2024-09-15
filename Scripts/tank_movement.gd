extends VehicleBody3D

@export var left_wheel : VehicleWheel3D
@export var right_wheel : VehicleWheel3D

var current_throttle : float = 0

@export var acceleration_amount : float
@export var deceleration_amount : float

@export var max_throttle : float
@export var max_reverse_throttle : float

func _ready() -> void:
	print(max_throttle)
	print(max_reverse_throttle)


func _process(delta: float) -> void:
	# Throttle control
	if Input.is_action_pressed("throttle_up") && current_throttle < max_throttle :
		current_throttle += acceleration_amount * delta
	if Input.is_action_pressed("throttle_down") && current_throttle > max_reverse_throttle :
		current_throttle -= deceleration_amount * delta
	
	# Left Right track control
	if Input.is_action_pressed("left_stick") :
		left_wheel.engine_force = current_throttle
		print("LEFT STICK")
	else :
		left_wheel.engine_force = 0
	if Input.is_action_pressed("right_stick") :
		right_wheel.engine_force = current_throttle
		print("RIGHT STICK")
	else :
		right_wheel.engine_force = 0
		
	print(current_throttle)
