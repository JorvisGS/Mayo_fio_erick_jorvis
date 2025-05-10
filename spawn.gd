extends Node2D

@onready var area = $Area2D
@export var escena_a_instanciar: PackedScene
var ya_instanciado = false

func _ready():
	area.body_entered.connect(_cuando_jugador_entre)

func _cuando_jugador_entre(body):
	if ya_instanciado:
		return
	if body.is_in_group("jugador"):  # Asegúrate que el jugador esté en este grupo
		var obj = escena_a_instanciar.instantiate()
		get_parent().add_child(obj)
		obj.global_position = global_position
		ya_instanciado = true
