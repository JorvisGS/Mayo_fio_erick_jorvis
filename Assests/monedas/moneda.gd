extends Area2D
# Called when the node enters the scene tree for the first time.

signal collected

func _ready():
	connect("body_entered", _on_body_entered)

func _on_body_entered(body):
	if body.name == "CharacterBody2D":  # or check for group if you use groups
		emit_signal("collected")
		var tween = create_tween()
		tween.tween_property(self, "position", position + Vector2(0, -30), 0.5)
		tween.tween_property(self, "modulate:a", 0.0, 0.5)
		tween.tween_callback(queue_free)
		#queue_free()  # remove the coin
