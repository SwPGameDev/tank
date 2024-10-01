extends RigidBody3D

func _physics_process(delta: float) -> void:
	if get_contact_count() > 0 :
		print("Boom")
		# Explosion and damage stuff
		queue_free()

func launch_shell(launch_force) :
	apply_central_impulse(launch_force)
