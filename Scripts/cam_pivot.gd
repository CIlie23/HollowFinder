extends Node3D

var target_rotation_y = 0.0
var rotation_speed = 5.0

func _process(delta):
	# smooth interpolation to target
	rotation.y = lerp_angle(rotation.y, deg_to_rad(target_rotation_y), delta * rotation_speed)


func _input(event):
	if event.is_action_pressed("ui_left"):
		target_rotation_y += 90
	elif event.is_action_pressed("ui_right"):
		target_rotation_y -= 90
