extends Node3D

@onready var player: AnimatedSprite3D = $Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.play("idle")
