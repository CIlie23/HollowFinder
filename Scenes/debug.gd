extends Control

@onready var label: Label = $Label



func _process(delta: float) -> void:
	label.set_text("FPS %d" % Engine.get_frames_per_second())
