extends RigidBody2D

var floating = false
var ground_detected = false

# Este método es llamado cuando el cuerpo entra en contacto con otro cuerpo
func _on_RigidBody2D_body_entered(body):
	if body.is_in_group("Ground"):
		ground_detected = true
		floating = false
		$Timer.stop()

# Este método es llamado cuando el cuerpo sale del contacto con otro cuerpo
func _on_RigidBody2D_body_exited(body):
	if body.is_in_group("Ground"):
		ground_detected = false
		$Timer.start()

# Este método es llamado cuando el temporizador se agota
func _on_Timer_timeout():
	if not ground_detected:
		self.gravity_scale = 1.0 # Vuelve a activar la gravedad para que el bloque caiga

# Este método se llama cada frame
func _process(delta):
	if not ground_detected and !floating:
		$Timer.start()
		floating = true

func _ready():
	# Conectar señales
	$Timer.connect("timeout", self, "_on_Timer_timeout")
	connect("body_entered", self, "_on_RigidBody2D_body_entered")
	connect("body_exited", self, "_on_RigidBody2D_body_exited")
	# Asegúrate de que la gravedad esté desactivada inicialmente
	self.gravity_scale = 0.0
