extends VehicleBody3D

@export var gear_label : Label3D

@export var left_wheels : Array[VehicleWheel3D] = []
@export var right_wheels : Array[VehicleWheel3D] = []

var current_throttle : float = 0

@export var acceleration_amount : float
@export var deceleration_amount : float

@export var max_throttle : float
@export var max_reverse_throttle : float

enum gearing {reverse, neutral, park, drive_one, drive_two}



@export_enum("reverse", "neutral", "park", "drive_one", "drive_two") var gear_enum: String = "park"
var gear_dict = {"reverse": -1, "neutral": 0, "park": 1, "drive_one": 2, "drive_two": 3}


var current_gear : gearing

func _ready() -> void:
	#gear_label_update()
	
	var selected_gear = gear_dict[gear_enum]
	print(selected_gear)

func _process(delta: float) -> void:
	# Throttle control
	if Input.is_action_pressed("throttle_up") && current_throttle < max_throttle :
		current_throttle += acceleration_amount * delta
	if Input.is_action_pressed("throttle_down") && current_throttle > max_reverse_throttle :
		current_throttle -= deceleration_amount * delta
	
	# Left Right track control
	if Input.is_action_pressed("left_stick") :
		for left_wheel in left_wheels :
			left_wheel.engine_force = current_throttle
	else :
		for left_wheel in left_wheels :
			left_wheel.engine_force = 0
	
	if Input.is_action_pressed("right_stick") :
		for right_wheel in right_wheels :
			right_wheel.engine_force = current_throttle
	else :
		for right_wheel in right_wheels :
			right_wheel.engine_force = 0
		
	if Input.is_action_just_pressed("gear_up") :
		gear_up()
		
	if Input.is_action_just_pressed("gear_down") :
		gear_down()
		
	if Input.is_action_just_pressed("park") :
		park()
	
	#print(current_throttle)
	
func gear_up() :
	pass
	
func gear_down() :
	pass
	
func park() :
	if current_gear == gearing.neutral :
		current_gear == gearing.park
	pass
	
#func gear_label_update() :
	#match current_gear :
		#gearing.reverse :
			#gear_label.text = "Gear: Reverse"
		#gearing.neutral :
			#gear_label.text = "Gear: Neutral"
		#gearing.park :
			#gear_label.text = "Gear: Park"
		#gearing.drive_one :
			#gear_label.text = "Gear: Drive One"
		#gearing.drive_two :
			#gear_label.text = "Gear: Drive Two"
		#
	#
