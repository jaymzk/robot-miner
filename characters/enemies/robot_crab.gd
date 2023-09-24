extends CharacterBody2D

@export var speed = 50

@export var travel_distance = 100

@export var player_damage = 0.5

var direction = -1

var limit_left

var limit_right


var damaging_player = false

#get the gravity

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


# Called when the node enters the scene tree for the first time.
func _ready():
	limit_left = position.x - travel_distance
	limit_right = position.x + travel_distance
	$AnimationPlayer.play("move_left")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if damaging_player:
		Global.energy -= player_damage
		get_tree().call_group("gui", "update_energy")
	check_position()
	
	if not is_on_floor():
		velocity.y += gravity + delta
	
	velocity.x = direction * speed
	
	move_and_slide()



func check_position():
	if position.x <= limit_left:
		direction = +1
		$AnimationPlayer.play("move_right")
	if position.x >= limit_right:
		direction = -1	
		$AnimationPlayer.play("move_left")

func _on_player_detector_front_body_entered(body):
	if body.collision_layer == 2:
		if direction == -1:
			direction = 1
			$AnimationPlayer.play("move_right")
		else:
			direction = -1
			$AnimationPlayer.play("move_left")
			
	if body.name == "Player":
		damaging_player = true
	

func _on_player_detector_front_body_exited(body):
	if body.name == "Player":
		damaging_player = false
	

func _on_player_detector_head_body_entered(body):
	Global.enemies_destroyed +=1
	get_tree().call_group("gui", "update_enemies_destroyed")
	queue_free()


func _on_player_detector_rear_body_entered(body):
	if body.collision_layer == 2:
		if direction == -1:
			direction = 1
			$AnimationPlayer.play("move_right")
		else:
			direction = -1
			$AnimationPlayer.play("move_left")
			
	if body.name == "Player":
		damaging_player = true


func _on_player_detector_rear_body_exited(body):
	damaging_player = false
