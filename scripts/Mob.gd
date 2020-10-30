extends Area2D

signal hit
var _timer = null
var p = 0
var screen_size
var flag = false
var rand = RandomNumberGenerator.new()

func _ready():
	rand.randomize()
	p = rand.randf_range(0,1)
	screen_size = get_viewport_rect().size
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(4.0)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()
	
func _on_Timer_timeout():
	rand.randomize()
	p = rand.randf_range(0,1)
	
func _on_Mob_area_entered(body):
	if !"Mob" in body.name and flag == true:
		queue_free()
		Player.count += 1
	elif !"Mob" in body.name and flag == false:
		Player.health -= 1
			
		

func _process(delta):
	rand.randomize()
	var x = rand.randf_range(0,1)
	rand.randomize()
	var y = rand.randf_range(0,1)
	if p < 0.25:
		position.y += y
		position.x += x
	elif p > 0.25 and p < 0.5:
		position.y -= y
		position.x -= x
	elif p > 0.5 and p < 0.75:
		position.y += y
		position.x -= x
	elif p > 0.75 and p < 1:
		position.y -= y
		position.x += x
	
	if position.y > 360:
		flag = true
	
	if (position.y > screen_size.y or position.y < 0 or position.x > screen_size.x or position.x < 0) and flag == true:
		queue_free()
		Player.health -= 1

