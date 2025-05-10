extends RigidBody2D
@onready var raycast = $RayCast2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	apply_central_impulse(Vector2(5, 0))  # Movimiento horizontal suave, sin salto
	material.bounce = 0
	material.friction = 1
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		# Si el raycast está tocando el suelo (o el terreno), la pelota puede continuar
		if collider.is_in_group("suelo"):
			pass
		else:
			pass
