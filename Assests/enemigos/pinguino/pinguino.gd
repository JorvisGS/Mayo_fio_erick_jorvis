extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var abajo: RayCast2D = $abajo
@onready var deteccion: RayCast2D = $deteccion
@onready var derecha: RayCast2D = $derecha
@onready var izquierda: RayCast2D = $izquierda
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var target: Node = null
var velocidad: float = 20
var gravedad: float = 150.0
var direccion: int = 1
var lanzado: bool = false
var lanzamiento_en_proceso: bool = false
var sorprendido: bool = false

func _ready() -> void:
	animation_player.play("quieto")
func _physics_process(delta: float) -> void:
	# Detección y preparación de lanzamiento
	if deteccion.is_colliding() and not lanzado and not lanzamiento_en_proceso:
		target = deteccion.get_collider()
		if target and target.is_in_group("jugador"):
			iniciar_lanzamiento()

	# Si está sorprendido, no se mueve
	if sorprendido:
		velocity = Vector2.ZERO
		move_and_slide()
		return

	# Si no está lanzado, comportamiento normal
	if not lanzado:
		# Gravedad
		if not abajo.is_colliding():
			velocity.y += gravedad * delta
		else:
			velocity.y = 0

		# Cambiar dirección
		if derecha.is_colliding():
			direccion = -1
			sprite.flip_h = true
			deteccion.target_position.x = -58
		elif izquierda.is_colliding():
			direccion = 1
			sprite.flip_h = false
			deteccion.target_position.x = 58

		velocity.x = direccion * velocidad


	move_and_slide()


func iniciar_lanzamiento() -> void:
	lanzamiento_en_proceso = true
	sorprendido = true
	animation_player.play("sorprendido")
	lanzamiento_con_delay()


func lanzamiento_con_delay() -> void:
	await get_tree().create_timer(0.4).timeout  # Tiempo de la animación "sorprendido"
	sorprendido = false
	lanzado = true
	deteccion.enabled = false
	velocity.x = direccion * 100
	animation_player.play("lanzarse")

	await get_tree().create_timer(1).timeout  # Tiempo que dura lanzado
	lanzado = false
	deteccion.enabled = true
	animation_player.play("quieto")
	lanzamiento_en_proceso = false
