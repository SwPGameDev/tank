extends Node

enum gear_types {reverse, neutral, drive, turbo}
var current_gear : gear_types = gear_types.neutral
var park_engaged : bool = true

signal gear_update(current_gear)
signal park_update

func _process(delta: float) -> void:
	if !park_engaged :
		if Input.is_action_just_pressed("gear_up") :
			if current_gear < (gear_types.size() - 1) :
				current_gear += 1
				# EMIT GEAR
		elif Input.is_action_just_pressed("gear_down") :
			if current_gear > 0 :
				current_gear -= 1
				# EMIT GEAR
	
	if Input.is_action_just_pressed("park") :
		if current_gear == gear_types.neutral :
			park_engaged = !park_engaged
			# EMIT PARK
