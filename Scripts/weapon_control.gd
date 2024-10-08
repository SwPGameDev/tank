extends Node

@export_category("References")
@export var tank : RigidBody3D
@export var turret : Node3D
@export var main_gun : Node3D
@export var main_gun_muzzle : Node3D

@export var coax_gun_control : Node

@export var audio_control : Node

@export var shell : PackedScene


@export_category("Main Gun")
@export var shell_launch_force : float
@export var shell_damage : float
## Seconds to reload after empty
@export var main_gun_reload_speed : float
@export var main_gun_ammo : int



@export_category("Turret Movement")
@export var rotate_speed : float
@export var elevate_speed : float

@export var max_elevate : float = -20
@export var min_elevate : float = 15


func _process(delta: float) -> void:
	
	# Turret left right
	var traverse_axis = Input.get_axis("traverse_right", "traverse_left")
	if traverse_axis != 0 :
		turret.rotate_y(traverse_axis * rotate_speed * delta)
	
	# Main Gun up down
	if Input.is_action_pressed("elevate_up") && main_gun.rotation_degrees.x > max_elevate :
		main_gun.rotate_x(-1 * elevate_speed * delta)
	elif Input.is_action_pressed("eleveate_down") && main_gun.rotation_degrees.x < min_elevate :
		main_gun.rotate_x(elevate_speed * delta)
	
	if Input.is_action_just_pressed("main_fire") :
		fire_main_gun()
		
	if Input.is_action_pressed("secondary_fire") :
		coax_gun_control.start_firing_coax_gun()
	if Input.is_action_just_released("secondary_fire") :
		coax_gun_control.stop_firing_coax_gun()
	


func fire_main_gun():
	audio_control.play_main_gun_stream()
	var shell_inst = shell.instantiate()
	add_child(shell_inst)
	shell_inst.global_transform = main_gun_muzzle.global_transform
	shell_inst.global_rotation = main_gun_muzzle.global_rotation
	shell_inst.top_level = true
	shell_inst.linear_velocity = tank.linear_velocity
	shell_inst.launch_shell(shell_launch_force * main_gun_muzzle.global_transform.basis.z)
