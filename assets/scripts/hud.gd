extends CanvasLayer

var score = 0

func _ready():
	$music.play()

func add_score():
	score += 1
	$score.text = str(score)

func game_over():
	$music.stop()
	$score.hide()
	$game_over/animation.play("game_over")
	$game_over/last_score.text = str(score)
	
	if score > game_controller.best_score:
		game_controller.best_score = score
	
	$game_over/best_score.text = str(game_controller.best_score)

func _on_menu_pressed():
	get_tree().change_scene("res://assets/scene/main_menu.tscn")


func _on_restart_pressed():
	get_tree().reload_current_scene()
