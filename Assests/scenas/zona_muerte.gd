extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("jugador"):
		if body.has_method("reproducir_animacion_daño"):
			body.reproducir_animacion_daño()
			await get_tree().create_timer(1.5).timeout  # espera 1.5 segundos
			
