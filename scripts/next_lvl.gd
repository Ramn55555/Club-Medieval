extends Area2D

export(String) var escena

func _physics_process(delta):
	for body in get_overlapping_bodies():
		if body is KinematicBody2D:
			var scene = load(escena)
			get_tree().change_scene_to(scene)
