extends StaticBody2D

var opened = false




# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	for body in $AreaOpen.get_overlapping_bodies():
		if body is KinematicBody2D:
			if opened == false: 
				$AnimationPlayer.play("openchest")
				opened = true
			
	
	#for body in $AreaClose.get_overlapping_bodies():
		#if body is KinematicBody2D:
			#if opened == true:
				#opened = false
				#$AnimationPlayer.play_backwards("openchest")
				
