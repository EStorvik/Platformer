extends CharacterBody2D


const ACCELERATION = 450.0
const MAX_VELOCITY = 300.0
const left_button = "ui_left"
const right_button = "ui_right"

const JUMP_ACCELERATION = -300.0
const INITIAL_JUMP_VELOCITY = -200
var jumping = false
var jump = "ui_accept"


const GRAVITY = 600


func _physics_process(delta):

	# Add the gravity.
	if not is_on_floor():
		velocity.y += GRAVITY * delta
		if jumping:
			velocity.y += JUMP_ACCELERATION * delta
			if Input.is_action_just_released(jump) or velocity.y>0:
				print("here")
				jumping = false

	# Handle jump.
	if Input.is_action_just_pressed(jump) and is_on_floor():
		velocity.y = INITIAL_JUMP_VELOCITY
		jumping = true


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis(left_button, right_button)
	if direction:
		velocity.x = move_toward(velocity.x, direction*MAX_VELOCITY, ACCELERATION * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, ACCELERATION*delta)

	print(velocity)
	move_and_slide()
