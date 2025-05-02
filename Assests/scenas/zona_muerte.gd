extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("jugador"):
		if body.has_method("reproducir_animacion_daño"):
			var canvas_layer = get_parent().get_node("../CanvasLayer")
			if body.has_method("recibir_golpe"):
				body.recibir_golpe()
			canvas_layer.take_damage()
			body.reproducir_animacion_daño()
			await get_tree().create_timer(1.5).timeout  # espera 1.5 segundos
			
