# Enemy.gd
extends KinematicBody2D

const GRAVITY = 10
const SPEED = 100
const FLOOR = Vector2(0, -1)

var velocity = Vector2()

var direction = 1

func _ready():
	pass

# warning-ignore:unused_argument
func _physics_process(delta: float):
	velocity.x = SPEED * direction
	
	if direction == 1:
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.flip_h = true
	
	$AnimatedSprite.play("default")
	
	velocity.y += GRAVITY
	velocity = move_and_slide(velocity, FLOOR)
	
	
	if is_on_wall():
		direction = direction * -1
		
	
	pass














	pass