extends Area2D


signal hit
var count = 0
var speed = 10
var vel = Vector2()

func _process(delta):
	if Input.is_action_just_pressed("shot") and count < 1:
		vel= Vector2(get_global_mouse_position().x-640, get_global_mouse_position().y-650)
		count+=1
	position += vel.normalized() * speed
	
func _on_Bullet_area_entered(area):
	hide()  # Player disappears after being hit.
	emit_signal("hit")
	$BulletCollision.set_deferred("disabled", true)
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
