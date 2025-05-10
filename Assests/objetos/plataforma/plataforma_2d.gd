extends CharacterBody2D

@export var speed: float = 50.0        
@export var distance: float = 20.0     
var direction: int = 1                  
var start_y: float                      

func _ready():
	start_y = global_position.y

func _physics_process(delta):
	# Movimiento vertical
	var move_y = speed * direction * delta
	global_position.y += move_y

	# Revertir dirección si pasa los límites
	if global_position.y >= start_y + distance:
		direction = -1
	elif global_position.y <= start_y - distance:
		direction = 1
