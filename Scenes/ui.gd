extends Control

@export var objSprite: Texture2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var rich_text_label: RichTextLabel = $Control/RichTextLabel
@onready var sprite_2d: Sprite2D = $Control/Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite_2d.texture = objSprite
	animation_player.play("testAppear")
	
