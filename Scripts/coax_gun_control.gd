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
@export var reload_cooldown : float
var reload_timer : float = 0
## Fire rate per minute
@export var fire_rate : float
@export var max_ammo : int
var current_ammo : int

@export_category("Fire Control")
@export var can_fire : bool = true
@export var firing : bool = false
@export var reloading : bool = false
var shoot_cooldown_timer : float = 0


func _ready() -> void :
	current_ammo = max_ammo
	


func _process(delta: float) -> void :
	if firing :
		if can_fire :
			shoot_coax_gun_bullet()
			current_ammo -= 1
			shoot_cooldown_timer = 0
			can_fire = false
			
		
	
	if !can_fire :
		shoot_cooldown_timer += delta
		if shoot_cooldown_timer > ( 1 / (fire_rate / 60) ) :
			can_fire = true
			shoot_cooldown_timer = 0
	
	print(current_ammo)
	

func start_firing_coax_gun() :
	firing = true
	

func stop_firing_coax_gun() :
	firing = false
	

func shoot_coax_gun_bullet() :
	print("BANG")
	audio_control.play_coax_gun_stream()
	var bullet_inst = bullet.instantiate()
	add_child(bullet_inst)
	bullet_inst.global_transform = coax_gun_muzzle.global_transform
	bullet_inst.global_rotation = coax_gun_muzzle.global_rotation
	bullet_inst.top_level = true
	bullet_inst.linear_velocity = tank.linear_velocity
	bullet_inst.launch_bullet(bullet_launch_force * coax_gun_muzzle.global_transform.basis.z)
	
