extends Node3D

@export var findableSprite: Texture2D
@onready var sprite_3d: Sprite3D = $CharacterBody3D/AnimatedSprite3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite_3d.texture = findableSprite
