extends Node2D

@onready var timer = $Timer
@export var bola_escena: PackedScene 

func _ready():
	timer.wait_time = 2.0  
	timer.autostart = true
	timer.one_shot = false
	timer.timeout.connect(_generar_bola)
	timer.start()

func _generar_bola():
	if bola_escena == null:
		return

	var bola = bola_escena.instantiate()
	get_parent().add_child(bola)
	bola.global_position = global_position  
