extends TextureButton

@export var charPortrait: Texture2D
@export var charName: String
@export var charLevel: PackedScene


@onready var portrait: TextureRect = $VBoxContainer/TextureRect
@onready var lbl_name: Label = $VBoxContainer/lblName
#@onready var lbl_chat: Label = $lblChat

func _ready() -> void:
	lbl_name.text = charName
	portrait.texture = charPortrait


func _on_pressed() -> void:
	if charLevel:
		get_tree().change_scene_to_packed(charLevel)
