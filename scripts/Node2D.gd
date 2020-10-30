extends Node2D

var _timer = null
var x = 3.0
onready var sc = get_node("/root/Player")
onready var ts = get_node("/root/Mob")

func _ready():
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(x)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()

func _on_Timer_timeout():
	x = x * 0.98
	_timer.set_wait_time(x)
	var rand = RandomNumberGenerator.new()
	var enemyscene = load("res://scenes/Mob.tscn")
	var screen_size = get_viewport().get_visible_rect().size
	var enemy = enemyscene.instance()
	rand.randomize()
	var x = rand.randf_range(10,screen_size.x - 10)
	rand.randomize()
	var y = rand.randf_range(10,screen_size.y/2 - 20)
	enemy.position.y = y
	enemy.position.x = x
	add_child(enemy)
var vel = Vector2()

func _process(delta):
	if Input.is_action_just_released("shot"):
		var bulletscene = load("res://scenes/Bullet.tscn")
		var bullet = bulletscene.instance()
		bullet.position.y = 640
		bullet.position.x = 650
		add_child(bullet)
	$Label.text = str(sc.count)
	$Label2.text = str (sc.health)
	if (sc.health <= 0):
		get_tree().change_scene("res://scenes/GameOver.tscn")
