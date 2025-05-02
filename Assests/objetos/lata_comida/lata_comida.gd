extends Area2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
signal comida

func _on_body_entered(body):
	collision_shape_2d.disabled = true
	if body.is_in_group("jugador"):
		emit_signal("comida")
		#var canvas_layer =get_node("../CanvasLayer")
		#canvas_layer.heal()
		var tween = create_tween()
		tween.tween_property(self, "position", position + Vector2(0, -15), 0.5)
		tween.tween_property(self, "modulate:a", 0.0, 0.5)
		tween.tween_callback(queue_free)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered", _on_body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
