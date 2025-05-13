extends Area2D
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("jugador"):
			await get_tree().create_timer(0.5).timeout  # espera 1.5 segundos
			get_tree().change_scene_to_file("res://Assests/menus/MenuPausa/ganaste.tscn")
