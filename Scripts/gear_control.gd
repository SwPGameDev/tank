extends Node

@export var gear_label : Label3D
@export var parked_label : Label3D

enum gear_types {reverse, neutral, drive, turbo}
var current_gear : gear_types = gear_types.neutral
var park_engaged : bool = true

func _ready() -> void:
	update_gear_label()
	update_parked_label()
	

func _process(delta: float) -> void:
	if !park_engaged :
		if Input.is_action_just_pressed("gear_up") :
			gear_up()

		if Input.is_action_just_pressed("gear_down") :
			gear_down()
	
	if Input.is_action_just_pressed("park") :
		toggle_park()
	


func gear_up() :
	if current_gear < (gear_types.size() - 1) :
		current_gear += 1
	update_gear_label()
	

func gear_down() :
	if current_gear > 0 :
		current_gear -= 1
	update_gear_label()
	

func toggle_park() :
	if current_gear == gear_types.neutral :
		park_engaged = !park_engaged
		update_parked_label()
	

func update_gear_label() :
	gear_label.text = "Gear: " + str(gear_types.find_key(current_gear).capitalize())

func update_parked_label() :
	if park_engaged :
		parked_label.text = "Parked: ✔"
	else :
		parked_label.text = "Parked: ❌"
	
