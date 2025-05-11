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


func _on_lata_comida_2_comida() -> void:
	pass # Replace with function body.


func _on_moneda_22_collected() -> void:
	pass # Replace with function body.


func _on_moneda_24_collected() -> void:
	pass # Replace with function body.


func _on_moneda_60_collected() -> void:
	pass # Replace with function body.


func _on_moneda_59_collected() -> void:
	pass # Replace with function body.


func _on_moneda_58_collected() -> void:
	pass # Replace with function body.


func _on_moneda_57_collected() -> void:
	pass # Replace with function body.


func _on_moneda_56_collected() -> void:
	pass # Replace with function body.


func _on_moneda_55_collected() -> void:
	pass # Replace with function body.


func _on_moneda_54_collected() -> void:
	pass # Replace with function body.


func _on_moneda_53_collected() -> void:
	pass # Replace with function body.


func _on_moneda_52_collected() -> void:
	pass # Replace with function body.


func _on_moneda_51_collected() -> void:
	pass # Replace with function body.


func _on_moneda_50_collected() -> void:
	pass # Replace with function body.


func _on_moneda_49_collected() -> void:
	pass # Replace with function body.


func _on_moneda_48_collected() -> void:
	pass # Replace with function body.


func _on_moneda_47_collected() -> void:
	pass # Replace with function body.


func _on_moneda_2_collected() -> void:
	pass # Replace with function body.


func _on_moneda_3_collected() -> void:
	pass # Replace with function body.


func _on_moneda_4_collected() -> void:
	pass # Replace with function body.


func _on_moneda_5_collected() -> void:
	pass # Replace with function body.


func _on_moneda_7_collected() -> void:
	pass # Replace with function body.


func _on_moneda_6_collected() -> void:
	pass # Replace with function body.


func _on_moneda_8_collected() -> void:
	pass # Replace with function body.


func _on_moneda_9_collected() -> void:
	pass # Replace with function body.


func _on_moneda_10_collected() -> void:
	pass # Replace with function body.


func _on_moneda_11_collected() -> void:
	pass # Replace with function body.


func _on_moneda_12_collected() -> void:
	pass # Replace with function body.


func _on_moneda_13_collected() -> void:
	pass # Replace with function body.


func _on_moneda_14_collected() -> void:
	pass # Replace with function body.


func _on_moneda_15_collected() -> void:
	pass # Replace with function body.


func _on_moneda_16_collected() -> void:
	pass # Replace with function body.


func _on_moneda_17_collected() -> void:
	pass # Replace with function body.


func _on_moneda_18_collected() -> void:
	pass # Replace with function body.


func _on_moneda_19_collected() -> void:
	pass # Replace with function body.


func _on_moneda_20_collected() -> void:
	pass # Replace with function body.


func _on_moneda_21_collected() -> void:
	pass # Replace with function body.


func _on_moneda_23_collected() -> void:
	pass # Replace with function body.


func _on_moneda_25_collected() -> void:
	pass # Replace with function body.


func _on_moneda_26_collected() -> void:
	pass # Replace with function body.


func _on_moneda_27_collected() -> void:
	pass # Replace with function body.


func _on_moneda_28_collected() -> void:
	pass # Replace with function body.


func _on_moneda_29_collected() -> void:
	pass # Replace with function body.


func _on_moneda_30_collected() -> void:
	pass # Replace with function body.


func _on_moneda_32_collected() -> void:
	pass # Replace with function body.




func _on_moneda_33_collected() -> void:
	pass # Replace with function body.


func _on_moneda_34_collected() -> void:
	pass # Replace with function body.


func _on_moneda_35_collected() -> void:
	pass # Replace with function body.


func _on_moneda_36_collected() -> void:
	pass # Replace with function body.


func _on_moneda_37_collected() -> void:
	pass # Replace with function body.


func _on_moneda_38_collected() -> void:
	pass # Replace with function body.


func _on_moneda_39_collected() -> void:
	pass # Replace with function body.


func _on_moneda_40_collected() -> void:
	pass # Replace with function body.


func _on_moneda_41_collected() -> void:
	pass # Replace with function body.


func _on_moneda_42_collected() -> void:
	pass # Replace with function body.


func _on_moneda_43_collected() -> void:
	pass # Replace with function body.


func _on_moneda_44_collected() -> void:
	pass # Replace with function body.


func _on_moneda_45_collected() -> void:
	pass # Replace with function body.


func _on_moneda_46_collected() -> void:
	pass # Replace with function body.
