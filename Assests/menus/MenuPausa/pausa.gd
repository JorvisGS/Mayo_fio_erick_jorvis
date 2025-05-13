extends CanvasLayer

@onready var color_rect: ColorRect = $ColorRect
@onready var vbox_container: VBoxContainer = $VBoxContainer
@onready var salir_button: Button = $VBoxContainer/SALIR

var is_game_paused = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	salir_button.visible = false

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("pausa"):
		is_game_paused = not is_game_paused
		get_tree().paused = is_game_paused
		$ColorRect.visible = is_game_paused
		$Label.visible = is_game_paused
		salir_button.visible = is_game_paused

	if Input.is_action_just_pressed("salir") and is_game_paused:
		go_to_main_menu()

func go_to_main_menu():
	get_tree().paused = false
	get_tree().change_scene("res://Assests/menus/MenuPrincipal/menu.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
