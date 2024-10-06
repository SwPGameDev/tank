extends Node

@export var tank_movement : Node
@export var gear_control : Node
@export var weapon_control : Node

@export var throttle_label : Label3D
@export var parked_label : Label3D
@export var gear_label : Label3D

var park_engaged

func _ready() -> void:
	update_gear_label()
	update_parked_label()
	update_throttle_Label()

func _process(delta: float) -> void:
	update_gear_label()
	update_parked_label()
	update_throttle_Label()

func update_throttle_Label() :
	throttle_label.text = "Throttle: " + str(snapped(tank_movement.current_throttle, 0.1))
	

func update_gear_label() :
	gear_label.text = "Gear: " + str(gear_control.gear_types.find_key(gear_control.current_gear).capitalize())
	

func update_parked_label() :
	if gear_control.park_engaged :
		parked_label.text = "Parked: ✔"
	else :
		parked_label.text = "Parked: ❌"
	
