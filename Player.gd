extends KinematicBody2D

# Velocidad del personaje
var speed = 400

func _process(delta):
	# Vector de movimiento inicializado a cero
	var motion = Vector2()

	# Capturar la entrada del teclado
	if Input.is_action_pressed("ui_right"):
		motion.x += 1
	if Input.is_action_pressed("ui_left"):
		motion.x -= 1
	if Input.is_action_pressed("ui_down"):
		motion.y += 1
	if Input.is_action_pressed("ui_up"):
		motion.y -= 1

	# Normalizar el vector de movimiento y multiplicar por la velocidad
	motion = motion.normalized() * speed

	# Mover el personaje usando move_and_slide
	move_and_slide(motion)
