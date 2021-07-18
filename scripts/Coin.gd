extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("coin")

func _physics_process(delta):
	for body in get_overlapping_bodies():
		if body is KinematicBody2D:
			if self.is_visible_in_tree():
				$efecto.play()
				self.hide()
				body.get_coin()
