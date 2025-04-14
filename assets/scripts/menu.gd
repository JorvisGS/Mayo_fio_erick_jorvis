extends Control

func _ready():
	$VBoxContainer/Button.grab_focus()

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/niveles.tscn")


func _on_button_2_pressed() -> void:
	get_tree().quit()
