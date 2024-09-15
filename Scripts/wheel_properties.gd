extends Node

@export var left_wheel : VehicleWheel3D
@export var right_wheel : VehicleWheel3D


func _ready() -> void:
	left_wheel.wheel_roll_influence
