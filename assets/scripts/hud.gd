extends CanvasLayer

var score = 0

func add_score():
	score += 1
	$score.text = str(score)

func game_over():
	$score.hide()
	$game_over/animation.play("game_over")
	$game_over/last_score.text = str(score)
	$game_over/best_score.text = str(score)

func _on_menu_pressed():
	get_tree().change_scene("res://assets/scene/main_menu.tscn")


func _on_restart_pressed():
	get_tree().reload_current_scene()
