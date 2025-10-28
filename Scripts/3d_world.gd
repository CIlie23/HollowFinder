extends Node3D

@onready var spawnable_spots = $SpawnableSpots.get_children()
@onready var findable = $Findable
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready():
	randomize()
	spawn_findable()
	animation_player.play("fadeOut")

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("randomizePos"):
			spawn_findable()
			
func spawn_findable():
	var random_spot = spawnable_spots.pick_random()
	findable.global_transform.origin = random_spot.global_transform.origin
