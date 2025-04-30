extends Node2D

var direccion = 1
const velocidad = 60

@onready var sprite:Sprite2D = $Sprite2D
@onready var ray_castderecha: RayCast2D = $RayCastderecha
@onready var ray_castizquierda: RayCast2D = $RayCastizquierda

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if ray_castderecha.is_colliding():
		direccion = -1
		sprite["flip_h"] = true
	if ray_castizquierda.is_colliding():
		direccion = 1
		sprite["flip_h"] = false
	position.x += direccion * velocidad * delta
