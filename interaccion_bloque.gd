extends RigidBody2D

var grabbed = false

func _process(delta):
	if grabbed:
		var player_position = get_node("/root/Main/Player").global_position
		global_position = player_position

func _physics_process(delta):
	if grabbed:
		# Desactivar la gravedad y el movimiento
		linear_velocity = Vector2()
		gravity_scale = 0.0
	else:
		# Activar la gravedad y permitir el movimiento
		gravity_scale = 1.0
