extends Node2D

onready var sc = get_node("/root/Player")

func _ready():
	$Score.text = str(sc.count,sc.health)


func _on_Button_pressed():
	sc.count = 0
	sc.health = 3
	get_tree().change_scene("res://scenes/Node2D.tscn")
	
	
