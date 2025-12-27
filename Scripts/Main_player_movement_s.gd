extends CharacterBody2D

const walk_speed = 250
const run_speed = 400

var current_speed = walk_speed

func _physics_process(delta):
	var direction = Input.get_vector("left","right","forward","back")
	
	if  Input.is_action_pressed("run"):
		current_speed = run_speed
	else:
		current_speed = walk_speed
	if direction:
		velocity.x= direction.x * current_speed
		velocity.y = direction.y * current_speed
	else:
		velocity.x = move_toward(velocity.x, 0, current_speed)
		velocity.y = move_toward(velocity.y, 0, current_speed)
	move_and_slide()
