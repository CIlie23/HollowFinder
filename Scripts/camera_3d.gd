extends Camera3D

@onready var ui: Control = $"../../CanvasLayer/UI"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

func _input(event):
	if event.is_action_pressed("click"):
		shoot_ray()

func shoot_ray():
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_lenght = 1000
	var from = project_ray_origin(mouse_pos)
	var to = from + project_ray_normal(mouse_pos) * ray_lenght
	var space = get_world_3d().direct_space_state
	var ray_query = PhysicsRayQueryParameters3D.new()
	ray_query.from = from
	ray_query.to = to
	var raycast_results = space.intersect_ray(ray_query)
	
	if raycast_results:
		var collider = raycast_results.collider
		print(raycast_results)
		
		if collider.is_in_group("Findable"):
			ui.visible = true
			await get_tree().create_timer(3).timeout
			animation_player.play("fadeIn")
			
			
		elif collider.is_in_group("Obstacle"):
			await handle_obstacle_hit(collider)


func handle_obstacle_hit(obstacle_node):
	var anim_player = obstacle_node.get_node_or_null("Animation")
	
	if anim_player:
		anim_player.play("fade")
		await anim_player.animation_finished
		obstacle_node.queue_free()
	else:
		obstacle_node.queue_free()

func animEnd():
	get_tree().change_scene_to_file("res://Scenes/2d_world.tscn")
	
