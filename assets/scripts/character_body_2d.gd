extends CharacterBody2D
class_name gatito

var velocidad = 150
var salto = 230
static var gravedad = 9
var aire = false
var quieto: bool = false  # Flag para saber si está quieto
var muerto = false

@onready var timer = $Timer  # Nodo Timer
@onready var anim = $AnimationPlayer
@onready var spr = $Sprite2D
@onready var son = $sonidos

func _ready():
	anim.play("sentado")


func _physics_process(delta: float) -> void:
	# Movimiento horizontal y vertical
	velocity.y += gravedad
	velocity.x = 0
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += velocidad
		quieto = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x += -velocidad
		quieto = false

	# Comprobación de si el personaje está en el aire
	if not is_on_floor() and velocity.y != 0:
		aire = true
	# Salto
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		$sonidos/salto.play()
		velocity.y -= salto
	# Animaciones
	if Input.is_action_pressed("ui_down") and is_on_floor() and velocity.x == 0:
		anim.play("sentado")
		quieto = true
	if aire and is_on_floor():
		anim.play("frenocaida")
		aire = false
	elif velocity.x != 0 and is_on_floor():
		anim.play("caminando")
	elif velocity.y < 0:
		anim.play("salto")
	elif aire:
		anim.play("caida")
	elif is_on_floor() and quieto == false:
		anim.play("quieto") 

	spr.flip_h = velocity.x < 0 if velocity.x != 0 else spr.flip_h
	move_and_slide()

# Este método se ejecuta cuando el Timer termina

func muerto_control() -> void:
	velocity.x = 0
	velocity.y += gravedad
	move_and_slide()

func salto_control(power:float) -> void:
	velocity.y = salto*power
	$sonidos/salto.play()
	
func daño() -> void:
	muerto = true
	
func _on_sprite_animation_finished():
	if $Sprite2D.animation == "muerto":
		print(muerto)
