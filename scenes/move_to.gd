extends Area2D

export(int) var x
export(int) var y


func _physics_process(delta):
	for body in get_overlapping_bodies():
		if body is KinematicBody2D:
			body.move_to(x,y)
