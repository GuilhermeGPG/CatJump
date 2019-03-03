extends Node2D

export (PackedScene) var ground
export (Vector2) var ground_range_x
export (int) var ground_y_position = 1000


func _ready():
	pass

func generate_ground(current_position_x):
	var new_ground = ground.instance()
	var new_position = Vector2(random_x_delta(current_position_x), ground_y_position)
	new_ground.position = new_position
	add_child(new_ground)

func random_x_delta(current_position_x):
	return rand_range(ground_range_x.x, ground_range_x.y) + current_position_x
	