extends Node2D

var direccion = 1
const velocidad = 60
var gravedad = 150

@onready var sprite:Sprite2D = $Sprite2D
@onready var ray_castderecha: RayCast2D = $RayCastderecha
@onready var ray_castizquierda: RayCast2D = $RayCastizquierda
@onready var ray_castabajo: RayCast2D = $RayCastabajo
@onready var ray_castabajo2: RayCast2D = $RayCastabajo2
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	
	if not ray_castabajo.is_colliding() and not ray_castabajo2.is_colliding():
		position.y += gravedad * delta
		set_process(false)   
	else:
		if ray_castderecha.is_colliding():
			direccion = -1
			sprite["flip_h"] = true
		if ray_castizquierda.is_colliding():
			direccion = 1
			sprite["flip_h"] = false
		position.x += direccion * velocidad * delta
	
