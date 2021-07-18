extends KinematicBody2D

class_name Knight

const GRAVITY_VEC = Vector2(0,900)
const WALK_SPEED = 250
const FLOOR_NORMAL = Vector2(0,-1)
const SLOPE_SLIDE_STOP = 25.0
const SIDING_CHANGE_SPEED = 10
const JUMP_SPEED = 300

var lineal_vel = Vector2()

var anim = ""

onready var sprite = $Sprite

func move_to(x,y):
	position.x = x
	position.y = y
	



func get_score(n):
	var texto = $CanvasLayer/Score.text
	var score = texto.split(" ")
	var contador = int(score[1])+n
	$CanvasLayer/Score.text = score[0]+" "+String(contador)


func get_coin():
	get_score(1)
	

func kill_gusano():
	get_score(10)

	
func _physics_process(delta):
	###Movimiento###
	#aplicar gravedad
	lineal_vel += delta * GRAVITY_VEC
	#aplicar mov horizontal
	lineal_vel = move_and_slide(lineal_vel, FLOOR_NORMAL, SLOPE_SLIDE_STOP)
	#detectar piso#
	var on_floor = is_on_floor()
	

	###Control###
	var target_speed = 0
	if Input.is_action_pressed("izquierda"):
		target_speed -= 1
	if Input.is_action_pressed("derecha"):
		target_speed += 1

	target_speed *= WALK_SPEED
	lineal_vel.x = lerp(lineal_vel.x, target_speed, 0.1)

	#salto#
	if on_floor and Input.is_action_just_pressed("saltar"):
		lineal_vel.y = -JUMP_SPEED
		$Jump.play()
	
	###Animacion###

	var new_anim = "idle"

	if on_floor:
		if lineal_vel.x < -SIDING_CHANGE_SPEED:
			sprite.scale.x=-1
			new_anim = "run"
		if lineal_vel.x > SIDING_CHANGE_SPEED:
			sprite.scale.x = 1
			new_anim = "run"
			
	else:
		if Input.is_action_pressed("derecha")and not Input.is_action_pressed("izquierda"):
			sprite.scale.x = 1
		if Input.is_action_pressed("izquierda")and not Input.is_action_pressed("derecha"):
			sprite.scale.x = -1
		if lineal_vel.y < 0:
			new_anim = "jump"
		if lineal_vel.y > 0:
			new_anim = "fall"
			
		
		
		#jump
		#falling


	if new_anim != anim:
		anim = new_anim
		$AnimationPlayer.play(anim)








