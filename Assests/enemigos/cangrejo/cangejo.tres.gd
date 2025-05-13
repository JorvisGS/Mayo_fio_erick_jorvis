extends CharacterBody2D

@onready var ray_cast_arriba: RayCast2D = $RayCastArriba
@onready var zona_muerte_pinzas: Area2D = $RayCastArriba/ZonaMuertePinzas

func _ready() -> void:
	zona_muerte_pinzas.monitoring=false

func _on_body_entered(body: Node2D) -> void:
	if ray_cast_arriba.is_colliding():
		if body.is_in_group("jugador"):
			await get_tree().create_timer(0.8).timeout
			zona_muerte_pinzas.monitoring=true
			await get_tree().create_timer(1).timeout
			zona_muerte_pinzas.monitoring=false
