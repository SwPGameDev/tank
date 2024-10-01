extends Node

@export var throttle_label : Label3D
@export var parked_label : Label3D
@export var gear_label : Label3D

var park_engaged

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_gear_label()
	update_parked_label()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func update_gear_label() :
	#gear_label.text = "Gear: " + str(gear_types.find_key(current_gear).capitalize())
	pass

func update_parked_label() :
	if park_engaged :
		parked_label.text = "Parked: ✔"
	else :
		parked_label.text = "Parked: ❌"
	
