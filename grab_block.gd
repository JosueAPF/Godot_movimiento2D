extends KinematicBody2D

var grabbableBlock = null

func _ready():
	$Area2D.connect("body_entered", self, "_on_Area2D_body_entered")
	$Area2D.connect("body_exited", self, "_on_Area2D_body_exited")
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) # Capturar el mouse para evitar que se salga

func _process(delta):
	if Input.is_action_just_pressed("grab_block"):
		if grabbableBlock:
			grabbableBlock.grabbed = true
	elif Input.is_action_just_released("grab_block"):
		if grabbableBlock:
			grabbableBlock.grabbed = false

func _on_Area2D_body_entered(body):
	if body.is_in_group("Grabbable"):
		grabbableBlock = body

func _on_Area2D_body_exited(body):
	if body == grabbableBlock:
		grabbableBlock = null

