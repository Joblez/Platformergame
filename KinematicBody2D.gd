extends KinematicBody2D


# Declare member variables here. Examples:
var speed = 200
var jumpspeed = -180
var gravity = 200
var velocity = Vector2.ZERO

func get_input(): 
	velocity.x = 0
	if Input.is_action_pressed("right"):
		velocity.x += speed	
	if Input.is_action_pressed("left"):
		velocity.x -= speed
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jumpspeed
#
