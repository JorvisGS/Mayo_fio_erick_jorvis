extends Control

# Declare the necessary nodes
@onready var vbox_container: VBoxContainer = $VBoxContainer
@onready var nivel1_button: Button = $VBoxContainer/Nivel1
@onready var nivel2_button: Button = $VBoxContainer/Nivel2
@onready var nivel3_button: Button = $VBoxContainer/Nivel3

func _ready():
	# Connect the button press signals to their respective functions
	nivel1_button.pressed.connect(go_to_nivel1_scene)
	nivel2_button.pressed.connect(go_to_nivel2_scene)
	nivel3_button.pressed.connect(go_to_nivel3_scene)

func go_to_nivel1_scene():
	get_tree().change_scene_to_file("res://Assests/menus/MenuNivel1/menunivele1.tscn")

func go_to_nivel2_scene():
	get_tree().change_scene_to_file("res://Assests/menus/MenuNivel2/menunivele2.tscn")

func go_to_nivel3_scene():
	get_tree().change_scene_to_file("res://Assests/menus/MenuNivel3/menunivele3.tscn")
