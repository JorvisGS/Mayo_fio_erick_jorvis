extends CharacterBody2D

var velocidad = 0


func _physics_process(delta: float) -> void:
	# Movimiento horizontal y vertical
	velocity.x = 0
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += velocidad
	elif Input.is_action_pressed("ui_left"):
		velocity.x += -velocidad
