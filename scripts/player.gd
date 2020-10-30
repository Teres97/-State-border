extends Area2D

var pos = Vector2(640,500)
var count = 0
var health = 3

func _ready():
	Input.warp_mouse_position(pos)
	look_at(get_global_mouse_position())
	
func _physics_process(delta):
	look_at(get_global_mouse_position())
	
