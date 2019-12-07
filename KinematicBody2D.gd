extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 15
const ACCELERATION = 70
const JUMP_HEIGHT = -400
const MAX_SPEED = 300
var friction = false
var motion = Vector2()


# warning-ignore:unused_argument
func _physics_process(delta: float):
	motion.y += GRAVITY
	
	
	if Input.is_action_pressed("ui_right"):
		
		motion.x += ACCELERATION
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play("Run")

	elif Input.is_action_pressed("ui_left"):
		motion.x -= ACCELERATION
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("Run")
	else:
		$Sprite.play("Idle")
		friction = true
		motion.x = lerp(motion.x, 0, 0.35)
		
		
	if is_on_floor():
			if Input.is_action_just_pressed("ui_up"):
				$Sprite.play("Jump")
				motion.y = JUMP_HEIGHT
			if friction == true:
				motion.x = lerp(motion.x, 0, 0.05)
				
			
			else:
				$Sprite.play("Fall")
				motion.x = lerp(motion.x, 0, 0.05)
		
		
			
	
	motion = move_and_slide(motion, UP)
	
	
	pass
	
