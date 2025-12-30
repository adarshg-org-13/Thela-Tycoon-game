extends CharacterBody2D

const WALK_SPEED = 275
const RUN_SPEED = 430

var current_speed = WALK_SPEED
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "forward", "back")
	
	if Input.is_action_pressed("run"):
		current_speed = RUN_SPEED
	else:
		current_speed = WALK_SPEED

	if direction:
		velocity = direction * current_speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, current_speed)
	
	move_and_slide()
	update_animations(direction)

func update_animations(direction):
	if direction == Vector2.ZERO:
		animated_sprite.play("Idle animation")
		return 
	if direction.y < 0:
		animated_sprite.play("Up animation")
	elif direction.y > 0:
		animated_sprite.play("Down animation")
	else:
		if direction.x != 0:
			animated_sprite.flip_h = direction.x > 0
		if current_speed == RUN_SPEED:
			animated_sprite.play("Running animation")
		else:
			animated_sprite.play("Walk animation")
