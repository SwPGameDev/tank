extends Node

@export_category("Stream Refrences")
@export var engine_audio_stream : AudioStreamPlayer3D
@export var turret_audio_stream : AudioStreamPlayer3D
@export var main_gun_audio_stream : AudioStreamPlayer3D
@export var coax_gun_audio_stream : AudioStreamPlayer3D

@export_category("Audio File References")
@export var engine_file : AudioStream
@export var turret_file : AudioStream
@export var main_gun_fire_file : AudioStream
@export var main_gun_reload_file : AudioStream
@export var coax_gun_file : AudioStream

@export_category("Volume")
@export var engine_volume : float = -5
@export var turret_volume : float = -5
@export var main_gun_volume : float = -5
@export var coax_gun_volume : float = -5


func _ready() -> void:
	engine_audio_stream.stream = engine_file
	engine_audio_stream.volume_db = engine_volume
	
	turret_audio_stream.stream = turret_file
	turret_audio_stream.volume_db = turret_volume
	
	main_gun_audio_stream.stream = main_gun_fire_file
	main_gun_audio_stream.volume_db = main_gun_volume
	
	coax_gun_audio_stream.stream = coax_gun_file
	coax_gun_audio_stream.volume_db = coax_gun_volume


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func resume_engine_stream() :
	engine_audio_stream.stream_paused = false

func pause_engine_stream() :
	engine_audio_stream.stream_paused = true

func resume_turret_stream() :
	turret_audio_stream.stream_paused = false

func pause_turret_stream() :
	turret_audio_stream.stream_paused = true

func play_main_gun_stream() :
	main_gun_audio_stream.play()

func play_coax_gun_stream() :
	coax_gun_audio_stream.play()
