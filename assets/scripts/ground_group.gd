extends Node2D

export (PackedScene) var ground
export (Vector2) var ground_range_x
export (Vector2) var ground_range_y


func _ready():
	pass

func generate_ground(current_position_x):
	var new_ground = ground.instance()
	var new_position = Vector2(random_x_delta(current_position_x), random_y_delta())
	new_ground.position = new_position
	add_child(new_ground)

func random_x_delta(current_position_x):
	return rand_range(ground_range_x.x, ground_range_x.y) + current_position_x
	
func random_y_delta():
	return rand_range(ground_range_y.x, ground_range_y.y)