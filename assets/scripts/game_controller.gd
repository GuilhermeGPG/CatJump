extends Node

const FILE_PATH = "user://cat_jump.data"
var best_score = 0 setget set_best_score

func _ready():
	load_best_score()

func save_best_score():
	var file = File.new()
	file.open(FILE_PATH, File.WRITE)
	file.store_var(best_score)
	file.close()

func load_best_score():
	var file = File.new()
	if not file.file_exists(FILE_PATH):
		return
	
	file.open(FILE_PATH, File.READ)
	best_score = file.get_var()
	file.close() 

func set_best_score(new_score):
	best_score = new_score
	save_best_score()