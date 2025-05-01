extends CanvasLayer
@onready var moneda_label=$moneda_label
var coin_count = 0
func _on_moneda_collected():
	coin_count += 1
	moneda_label.text="x: "+ str(coin_count)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
