extends Node2D

signal Matched(AddScore)
var AreaCheck:area_check = null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if event.is_action_pressed("Select"):
		AreaCheck = load("res://area_check.tscn").instantiate()
		add_sibling(AreaCheck)
		AreaCheck.position = Vector2(0,0)
		AreaCheck.TopRight = get_global_mouse_position()
		pass
	if event.is_action_released("Select"):
		AreaCheck.Matched.connect(MatchedArea)
		AreaCheck.CheckArea()
		pass
	pass

func MatchedArea(AddScore):
	Matched.emit(AddScore)
	
