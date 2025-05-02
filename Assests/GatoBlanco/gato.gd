class_name gato 
extends CharacterBody2D

@export var gravedad = 100
@export var salto = 50
@export var velocidad = 100
var puede_moverse: bool = true



#animaciones
@onready var animation_player: AnimationPlayer = $Sprite2D/AnimationPlayer
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
func reproducir_animacion_daño():
	maquinaEstados["parameters/conditions/daño"] = true
	await get_tree().create_timer(0.1).timeout
	maquinaEstados["parameters/conditions/daño"] = false
	maquinaEstados["parameters/conditions/quieto"] = true


func _process(delta: float) -> void:
	animation_player.play("daño")
	
	
	#gravedad
	if not is_on_floor():
		velocity.y = velocity.y + gravedad * delta
	
	#variables controles
	var salto_presionado = Input.is_action_just_pressed("saltar")
	var derecha = Input.is_action_just_pressed("derecha")
	var izquierda = Input.is_action_just_pressed("izquierda")
	#variable direccion
	var direccion = Input.get_axis("izquierda","derecha")
	if puede_moverse:
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
	#funciones de daño
func morir():
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 0.5)
	await get_tree().create_timer(0.3).timeout
	tween.tween_callback(queue_free)
	set_process(false)   
	

func recibir_golpe():
	var jump_force = -100
	velocity.x = 0
	velocity.y = jump_force
	puede_moverse = false
	await get_tree().create_timer(0.4).timeout
	puede_moverse = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
