class_name gato 
extends CharacterBody2D

@export var gravedad = 100
@export var salto = 50
@export var velocidad = 100


#animaciones
@onready var maquinaEstados:AnimationTree = $AnimationTree
@onready var sprite:Sprite2D = $Sprite2D
func quieto(actiado:bool):
	maquinaEstados["parameters/conditions/quieto"] = actiado
	maquinaEstados["parameters/conditions/caminando"] = not actiado
func caminando(actiado:bool):
	maquinaEstados["parameters/conditions/caminando"] = actiado
	maquinaEstados["parameters/conditions/quieto"] = not actiado
func cayendo(actiado:bool):
	maquinaEstados["parameters/conditions/cayendo"] = actiado
	await get_tree().create_timer(0.1).timeout
	maquinaEstados["parameters/conditions/cayendo"] = not actiado



func _process(delta: float) -> void:
	
	
	#gravedad
	if not is_on_floor():
		velocity.y = velocity.y + gravedad * delta
	
	#variables controles
	var salto_presionado = Input.is_action_just_pressed("saltar")
	var derecha = Input.is_action_just_pressed("derecha")
	var izquierda = Input.is_action_just_pressed("izquierda")
	#variable direccion
	var direccion = Input.get_axis("izquierda","derecha")
	velocity.x = velocidad * direccion
	
	if  salto_presionado and is_on_floor():
		velocity.y += -salto
		cayendo(true)

	#animaciones#condiciones
	if direccion == 1:
		caminando(true)
		sprite["flip_h"] = false
	elif direccion == -1:
		caminando(true)
		sprite["flip_h"] = true
	else:
		quieto(true)
	
	move_and_slide()
