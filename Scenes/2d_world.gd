extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var viewEnding: Button = $HBoxContainer/Button2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("fadeOut")

#func _process(delta: float) -> void:
	#if Global.isEnding == true:
		#pass

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/mainMenu.tscn")

## --- Function to be called after finding an object ---
func object_was_found(object_id: int):
	match object_id:
		1:
			Global.isOneFound = true
		2:
			Global.isTwoFound = true
		3:
			Global.isThreeFound = true
		4:
			Global.isFourFound = true
	
	# Check the condition immediately after an object is found
	check_all_found()

## --- The Core Logic for Unlocking the Button ---
func check_all_found():
	# The button is unlocked ONLY if ALL variables are TRUE
	var all_objects_found: bool = (
		Global.isOneFound && 
		Global.isTwoFound && 
		Global.isThreeFound && 
		Global.isFourFound
	)
	
	if all_objects_found:
		viewEnding.disabled = false
		# continue_button.visible = true # If you hid it initially
		print("All objects found! Button unlocked.")
