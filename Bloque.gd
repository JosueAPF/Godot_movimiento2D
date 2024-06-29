extends Area2D

# Configuraciones
var pushForce = 200 # Fuerza de empuje o repulsión

# Al entrar en contacto con otra área
func _on_Area2D_body_entered(body):
	# Verificar si el cuerpo es el jugador
	if body.name == "Player":
		# Calcular la dirección del empuje
		var pushDirection = (body.global_position - global_position).normalized()
		# Aplicar el impulso al jugador
		body.apply_impulse(Vector2(), pushDirection * pushForce)

