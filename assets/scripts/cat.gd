extends KinematicBody2D

const GRAVITY = 2000
const SPEED = 500
const JUMP_FORCE = -900

var linear_valocity = Vector2(0, 0) 
var is_jumping = false
var is_moving = false
var is_alive = true

func _ready():
	set_process_input(true)

func _physics_process(delta):
	_set_gravity(delta)
	_jump_controller(delta)
	_check_death()
	

func _set_gravity(delta):
	linear_valocity.y += GRAVITY * delta

func _jump_controller(delta):
	if is_alive:
		if is_on_floor():
			linear_valocity.x = 0
			if is_jumping:
				linear_valocity.y = JUMP_FORCE
		elif is_moving:
			linear_valocity.x = SPEED
		else:
			linear_valocity.x = 0
		
		is_jumping = false
		
	linear_valocity = move_and_slide(linear_valocity, Vector2(0, -1))

func _check_death():
	if is_alive:
		if position.y > get_viewport_rect().size.y:
			is_alive = false
			