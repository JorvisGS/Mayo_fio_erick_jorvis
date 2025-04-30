extends Area2D


func _on_body_entered(body: Node2D) -> void:
	print("perdiste")
	get_tree().reload_current_scene()
