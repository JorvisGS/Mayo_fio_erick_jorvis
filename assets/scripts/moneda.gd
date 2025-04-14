extends Area2D

@onready var anim = $AnimationPlayer
func _ready():
	anim.play("moneda")
func _on_body_entered(body: Node2D) -> void:
	if body is gatito:
		Global.monedas +=1
		queue_free()
