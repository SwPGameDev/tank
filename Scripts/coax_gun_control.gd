extends Node

@export_category("References")
@export var tank : RigidBody3D
@export var audio_control : Node
@export var bullet : PackedScene
@export var coax_gun : Node3D
@export var coax_gun_muzzle : Node3D

@export_category("Stats")
@export var bullet_launch_force : float
@export var bullet_damage : float
## Seconds to reload after empty
@export var coax_gun_reload_time : float
## Fire rate per minute
@export var coax_gun_fire_rate : float
@export var coax_gun_max_ammo : int
@export var coax_gun_current_ammo : int

@export_category("Fire Control")
@export var coax_gun_can_fire : bool = true
@export var coax_gun_firing : bool = false
@export var coax_gun_reloading : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void :
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void :
	pass

func start_firing_coax_gun() :
	audio_control.play_coax_gun_stream()
	var bullet_inst = bullet.instantiate()
	add_child(bullet_inst)
	bullet_inst.global_transform = coax_gun_muzzle.global_transform
	bullet_inst.global_rotation = coax_gun_muzzle.global_rotation
	bullet_inst.top_level = true
	bullet_inst.linear_velocity = tank.linear_velocity
	bullet_inst.launch_bullet(bullet_launch_force * coax_gun_muzzle.global_transform.basis.z)

func stop_firing_coax_gun() :
	print("STOP")
	pass
