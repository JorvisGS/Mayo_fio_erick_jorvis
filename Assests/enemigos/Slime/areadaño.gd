extends Area2D

signal daño_recibido(daño)

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("jugador"):
		emit_signal("dano_recibido",1)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
