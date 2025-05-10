extends Area2D

var float_amplitude := 2.0
var float_speed := 2.0
var original_y := 0.0
var flotando := true  

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
signal comida

func _ready() -> void:
	connect("body_entered", _on_body_entered)
	original_y = position.y

func _process(delta: float) -> void:
	if flotando:
		position.y = original_y + sin(Time.get_ticks_msec() / 1000.0 * float_speed) * float_amplitude

func _on_body_entered(body):
	if not body.is_in_group("jugador"):
		return

	flotando = false  # Detiene el movimiento de arriba-abajo
	collision_shape_2d.disabled = true
	emit_signal("comida")

	self.monitoring = false
	set_deferred("monitoring", false)

	var tween = create_tween()
	tween.tween_property(self, "position", position + Vector2(0, -15), 0.5)
	tween.tween_property(self, "modulate:a", 0.0, 0.5)
	tween.tween_callback(queue_free)
