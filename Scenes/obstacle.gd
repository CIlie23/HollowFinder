extends StaticBody3D

@export var obsSprite: Texture2D
@onready var obstacle: Sprite3D = $Obstacle

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	obstacle.texture = obsSprite
