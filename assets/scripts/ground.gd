extends StaticBody2D

var is_moving = false
export (int) var speed = 100

func _ready():
	pass
	
func _process(delta):
	if is_moving:
		position.y += speed * delta
		
		if position.y > get_viewport_rect().size.y + ($sprite.texture.get_height()/ 2):
			queue_free()


func _on_area_body_entered(body):
	if body.name == "cat" and not is_moving:
		is_moving = true
		get_tree().call_group("node_ground_group", "generate_ground", position.x)