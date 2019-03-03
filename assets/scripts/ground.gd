extends StaticBody2D

var is_moving = false
var speed = 100
export (Vector2) var speed_range = Vector2(50, 250)

func _ready():
	randomize()
	speed = int(rand_range(speed_range.x, speed_range.y))
	
func _process(delta):
	if is_moving:
		position.y += speed * delta
		
		if position.y > get_viewport_rect().size.y + ($sprite.texture.get_height() / 2) or \
			position.x < 0 - ($sprite.texture.get_width() / 2):
			queue_free()


func _on_area_body_entered(body):
	if body.name == "cat" and not is_moving:
		is_moving = true
		get_tree().call_group("node_ground_group", "generate_ground", position.x)