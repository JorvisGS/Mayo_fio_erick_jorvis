extends CanvasLayer

func _ready() -> void:
	update_hearts()
	gato = get_parent().get_node("gato")
@onready var gato = get_node("../CharacterBody2D")
@onready var moneda_label=$moneda_label
var coin_count = 0
@export var heart_texture : Texture2D
var max_hearts := 3
var current_hearts := 3
var puntuacion :=0
#aaaaaaaaaaaaaaaaaaaaa
@onready var hearts := [
	$HBoxContainer/TextureRect,
	$HBoxContainer/TextureRect2,
	$HBoxContainer/TextureRect3
]

func take_damage(amount: int = 1):
	current_hearts = max(current_hearts - amount, 0)
	update_hearts()
	if current_hearts <= 0:
		gato.morir()
		await get_tree().create_timer(1).timeout
		get_tree().reload_current_scene()
#aaaaaaaaaaa
func heal(amount: int = 1):
	current_hearts = clamp(current_hearts + amount, 0, max_hearts)
	update_hearts()

func update_hearts():
	for i in range(max_hearts):
		if i < current_hearts:
			hearts[i].show()
		else:
			hearts[i].hide()

func _on_moneda_collected():
	coin_count += 1
	moneda_label.text="X: "+ str(coin_count)

# Called when the node enters the scene tree for the first time.

func _on_lata_comida_comida() -> void:
	heal()

func update_puntuacion():
	puntuacion+=1
	print(puntuacion)
