extends KinematicBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("idle")

func die():
	$AnimationPlayer.play("Die")
	$CollisionShape2D.disabled = true
	$Area2D/CollisionShape2D.disabled = true
	$Die.play()

func _physics_process(delta):
	for body in $Area2D.get_overlapping_bodies():
		print(body.get_class())
		if body is KinematicBody2D:	
			die()
			body.kill_gusano()
	for area in $Area2D.get_overlapping_areas():
		print(area)
		if area is Area2D:
			if area.get_class() == "sword":
				die()
				
		
