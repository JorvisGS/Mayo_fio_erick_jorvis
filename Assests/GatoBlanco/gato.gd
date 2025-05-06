class_name gato 
extends CharacterBody2D

@export var gravedad = 100
@export var salto = 50
@export var velocidad = 100
var puede_moverse: bool = true
var atacando = false


#animaciones
@onready var animation_player: AnimationPlayer = $Sprite2D/AnimationPlayer
@onready var maquinaEstados:AnimationTree = $AnimationTree
@onready var sprite:Sprite2D = $Sprite2D
@onready var attack_area =$area_atck

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
	maquinaEstados.active = false
	animation_player.play("daño")
	await get_tree().create_timer(0.3).timeout
	maquinaEstados.active = true
func reproducir_animacion_ataque():
	maquinaEstados.active = false
	animation_player.play("ataque")
	await get_tree().create_timer(0.1).timeout
	maquinaEstados.active = true

func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("atacar"):
		atacar()
	
	#gravedad
	if not is_on_floor():
		velocity.y = velocity.y + gravedad * delta
	
	#variables controles
	var salto_presionado = Input.is_action_just_pressed("saltar")
	var derecha = Input.is_action_just_pressed("derecha")
	var izquierda = Input.is_action_just_pressed("izquierda")
	var atacarF = Input.is_action_just_pressed("atacar")
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
	animation_player.play("daño")
	var jump_force = -100
	velocity.x = 0
	velocity.y = jump_force
	puede_moverse = false
	await get_tree().create_timer(0.4).timeout
	puede_moverse = true

func atacar():
	animation_player.play("ataque")
	atacando = true
	attack_area.monitoring = true  # activa el área de daño
	await get_tree().create_timer(0.2).timeout  # espera 0.2 segundos
	attack_area.monitoring = false  # desactiva el área
	atacando = false


func _on_area_atck_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemigos") and atacando == true:
		var enemigo = area.get_parent()
		if enemigo.has_method("recibir_golpe"):
			enemigo.recibir_golpe(1)
