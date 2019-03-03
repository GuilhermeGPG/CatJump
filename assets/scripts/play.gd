extends TouchScreenButton

func _ready():
	pass


func _on_play_pressed():
	get_tree().change_scene("res://assets/scene/game.tscn")
