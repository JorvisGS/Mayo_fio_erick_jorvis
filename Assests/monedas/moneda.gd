extends Area2D
# Called when the node enters the scene tree for the first time.

signal collected
@onready var maquinaEstados: AnimationTree = $AnimationTree
func moneda_normal(actiado:bool):
	maquinaEstados["parameters/conditions/normal"] = actiado
func moneda_agarrada(actiado:bool):
	maquinaEstados["parameters/conditions/normal"] = not actiado
	maquinaEstados["parameters/conditions/obtenida"] = actiado

func _ready():
	moneda_normal(true)
	connect("body_entered", _on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("jugador"):  # or check for group if you use groups
		emit_signal("collected")
		moneda_agarrada(true)
		var tween = create_tween()
		tween.tween_property(self, "position", position + Vector2(0, -15), 0.5)
		tween.tween_property(self, "modulate:a", 0.0, 0.5)
		tween.tween_callback(queue_free)
		#queue_free()  # remove the coin
