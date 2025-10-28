extends Node2D
@onready var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _on_play_pressed() -> void:
	audio.play()
	
	get_tree().change_scene_to_file("res://Scenes/2d_world.tscn")


func _on_controls_pressed() -> void:
	#audio.play()
	get_tree().change_scene_to_file("res://Scenes/controls.tscn")
