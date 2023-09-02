extends KinematicBody2D
var Movement = Vector2()
var up = Vector2(0, -1)
var speed = 200
const JUMP_FORCE = 21.0 

var isAttacking = false

func _ready():
	pass 

func _process(delta):
	move_and_collide(Vector2(0,6))
		
	if Input.is_action_pressed("ui_left") && isAttacking == false:
		Movement.x = -speed
		get_node("AnimatedSprite").set_flip_h(true)
		get_node("AnimatedSprite").play("Walk")
		
	elif Input.is_action_pressed("ui_right") && isAttacking == false:
		Movement.x = speed
		get_node("AnimatedSprite").set_flip_h(false)
		get_node("AnimatedSprite").play("Walk")	
		
	else:
		isAttacking == false
		Movement.x = 0
		get_node("AnimatedSprite").play("Idle")
	Movement = move_and_slide(Movement, up * delta)
#Attack
	if Input.is_action_just_pressed("Attack"):
		$AnimatedSprite.play("Attack")
		isAttacking = true
		
#Movement Control
	#JUMP
	if Input.is_action_pressed("ui_up"):
		get_node("AnimatedSprite").play("Jump")
		move_and_collide(Vector2(0,-JUMP_FORCE))
		
func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "Attack":
		isAttacking = false
	
	
	
	
