extends RigidBody2D

const MAX_SPEED = 100

func _integrate_forces(state):
	if linear_velocity.length() > MAX_SPEED:
		linear_velocity = linear_velocity.normalized() * MAX_SPEED
