extends Control

@onready var vbox_container: VBoxContainer = $VBoxContainer
@onready var jugar_button: Button = $VBoxContainer/Jugar

func _ready():
	jugar_button.pressed.connect(go_to_game_scene)

func go_to_game_scene():
	get_tree().change_scene_to_file("res://Assests/mundos/mundo_3.tscn")
