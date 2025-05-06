extends Node2D

var direccion = 1
const velocidad = 60
var gravedad = 150
var vida = 1

@onready var sprite:Sprite2D = $Sprite2D
@onready var ray_castderecha: RayCast2D = $RayCastderecha
@onready var ray_castizquierda: RayCast2D = $RayCastizquierda
@onready var ray_castabajo: RayCast2D = $RayCastabajo
@onready var ray_castabajo2: RayCast2D = $RayCastabajo2
@onready var area2d = $"areadaño"
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _ready() -> void:
	area2d.connect("daño_recibido",Callable(self, "_on_dano_recibido"))

func recibir_golpe(daño: int) -> void:
	vida -= daño
	print("Ay, el enemigo ha recibido daño.")
	if vida <= 0:
		morir()  # Llama a la función morir cuando la vida es 0 o menos

# Función para manejar la muerte del enemigo
func morir() -> void:
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 0.5)
	await get_tree().create_timer(0.3).timeout  # Espera 0.3 segundos
	queue_free()  # Elimina el enemigo
	llamada_inter()
	set_process(false)

func llamada_inter():
	var canvas_layer = get_parent().get_parent().get_node("CanvasLayer")
	canvas_layer.update_puntuacion()


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
	


func _on_areadaño_daño_recibido(daño: Variant) -> void:
	recibir_golpe(1)
