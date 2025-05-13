extends CanvasLayer

@onready var color_rect: ColorRect = $ColorRect
@onready var vbox_container: VBoxContainer = $VBoxContainer
@onready var salir_button: Button = $VBoxContainer/SALIR


# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_salir_pressed() -> void:
	get_tree().change_scene_to_file("res://Assests/menus/MenuLVL1-2/menuniveles.tscn")
