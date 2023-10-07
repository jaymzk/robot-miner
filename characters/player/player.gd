extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var facing_right = true
var jumping = false
var is_alive = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and is_alive:
		jumping = true
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if is_alive:
		var direction = Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()
		animate()

func animate():
	if velocity.x > 0 and is_on_floor():
		$AnimationPlayer.play("run_right")
		facing_right = true
	if velocity.x < 0 and is_on_floor():
		$AnimationPlayer.play("run_left")
		facing_right = false
		
	if velocity.x == 0 and is_on_floor():
		if facing_right:
			$AnimationPlayer.play("idle_right")
		if not facing_right:
			$AnimationPlayer.play("idle_left")
	
	if jumping:
		if facing_right:
			$AnimationPlayer.play("jump_right")
		if not facing_right:
			$AnimationPlayer.play("jump_left")
	
	if jumping and is_on_floor():
		jumping = false
		
func reset_game():
	Global.energy = 70
	Global.enemies_destroyed = 0
	get_tree().reload_current_scene()
	
func die():
	is_alive = false
	if not facing_right:
		$AnimationPlayer.play("die_left")
	if facing_right:
		$AnimationPlayer.play("die_right")

	reset_game()
	

	
