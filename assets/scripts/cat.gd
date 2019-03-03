extends KinematicBody2D

export (int) var GRAVITY = 2000
export (int) var SPEED = 500
export (int) var JUMP_FORCE = -900

var linear_valocity = Vector2(0, 0) 
var is_jumping = false
var is_moving = false
var is_alive = true

func _ready():
	set_process_input(true)

func _physics_process(delta):
	set_gravity(delta)
	jump_controller()
	player_death()
	play_animations()

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			is_moving = true and is_on_floor()
			is_jumping = true
		else:
			is_moving = false

func play_animations():
	if is_alive:
		if is_on_floor():
			$animation.play("idle")
		elif linear_valocity.y > 0:
			$animation.play("fall")
		elif linear_valocity.y < 0:
			$animation.play("jump")
	else:
		$animation.play("dead")

func set_gravity(delta):
	linear_valocity.y += GRAVITY * delta

func jump_controller():
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
		
	move_and_slide(linear_valocity, Vector2(0, -1))

func player_death():
	if is_alive:
		if position.y > get_viewport_rect().size.y:
			is_alive = false
			linear_valocity = Vector2(0, JUMP_FORCE)
			